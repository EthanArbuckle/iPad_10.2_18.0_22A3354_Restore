@implementation IDSQRProtoAllocBindRequest

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoAllocBindRequest;
  -[IDSQRProtoAllocBindRequest dealloc](&v3, sel_dealloc);
}

- (void)setServiceId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_serviceId = a3;
}

- (void)setHasServiceId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasServiceId
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasClientOsVersion
{
  return self->_clientOsVersion != 0;
}

- (BOOL)hasClientHwVersion
{
  return self->_clientHwVersion != 0;
}

- (void)setCapabilities:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapabilities
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)publishedStreamIdsCount
{
  return self->_publishedStreamIds.count;
}

- (unsigned)publishedStreamIds
{
  return self->_publishedStreamIds.list;
}

- (void)clearPublishedStreamIds
{
  PBRepeatedUInt32Clear();
}

- (void)addPublishedStreamIds:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)publishedStreamIdsAtIndex:(unint64_t)a3
{
  double v3;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_publishedStreamIds;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;

  p_publishedStreamIds = &self->_publishedStreamIds;
  count = self->_publishedStreamIds.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), v3, a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v12, v13, v14, v15);

  }
  return p_publishedStreamIds->list[a3];
}

- (void)setPublishedStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)clearSubscribedStreams
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_subscribedStreams, a2, v2, v3);
}

- (void)addSubscribedStreams:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *subscribedStreams;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  subscribedStreams = self->_subscribedStreams;
  v9 = (char *)v4;
  if (!subscribedStreams)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_subscribedStreams;
    self->_subscribedStreams = v7;

    v4 = v9;
    subscribedStreams = self->_subscribedStreams;
  }
  objc_msgSend_addObject_(subscribedStreams, v4, (uint64_t)v4, v5);

}

- (unint64_t)subscribedStreamsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_subscribedStreams, a2, v2, v3);
}

- (id)subscribedStreamsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_subscribedStreams, a2, a3, v3);
}

+ (Class)subscribedStreamsType
{
  return (Class)objc_opt_class();
}

- (void)setAllWildcardSubscription:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_allWildcardSubscription = a3;
}

- (void)setHasAllWildcardSubscription:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasAllWildcardSubscription
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMaxConcurrentStreams:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_maxConcurrentStreams = a3;
}

- (void)setHasMaxConcurrentStreams:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxConcurrentStreams
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setChannelBindingInfo:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_channelBindingInfo = a3;
}

- (void)setHasChannelBindingInfo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannelBindingInfo
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMaxEmbeddedStatsResponseDelay:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_maxEmbeddedStatsResponseDelay = a3;
}

- (void)setHasMaxEmbeddedStatsResponseDelay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMaxEmbeddedStatsResponseDelay
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearQuicConnectionInfos
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_quicConnectionInfos, a2, v2, v3);
}

- (void)addQuicConnectionInfo:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *quicConnectionInfos;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  quicConnectionInfos = self->_quicConnectionInfos;
  v9 = (char *)v4;
  if (!quicConnectionInfos)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_quicConnectionInfos;
    self->_quicConnectionInfos = v7;

    v4 = v9;
    quicConnectionInfos = self->_quicConnectionInfos;
  }
  objc_msgSend_addObject_(quicConnectionInfos, v4, (uint64_t)v4, v5);

}

- (unint64_t)quicConnectionInfosCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_quicConnectionInfos, a2, v2, v3);
}

- (id)quicConnectionInfoAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_quicConnectionInfos, a2, a3, v3);
}

+ (Class)quicConnectionInfoType
{
  return (Class)objc_opt_class();
}

- (void)setStateFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_stateFlags = a3;
}

- (void)setHasStateFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStateFlags
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasClientContextBlob
{
  return self->_clientContextBlob != 0;
}

- (int)reason
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_reason;
  else
    return 0;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReason
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)reasonAsString:(int)a3
{
  double v3;
  __CFString *v4;

  if (!a3)
    return CFSTR("NONE");
  if (a3 == 1)
  {
    v4 = CFSTR("NEWLY_JOINED");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsReason:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("NONE"), v5) & 1) != 0)
    isEqualToString = 0;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("NEWLY_JOINED"), v7);

  return isEqualToString;
}

- (BOOL)hasRandomSalt
{
  return self->_randomSalt != 0;
}

- (BOOL)hasAccessToken
{
  return self->_accessToken != 0;
}

- (BOOL)hasServerBlob
{
  return self->_serverBlob != 0;
}

- (BOOL)hasTestOption
{
  return self->_testOption != 0;
}

- (void)clearSessionExperiments
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_sessionExperiments, a2, v2, v3);
}

- (void)addSessionExperiments:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *sessionExperiments;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  sessionExperiments = self->_sessionExperiments;
  v9 = (char *)v4;
  if (!sessionExperiments)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_sessionExperiments;
    self->_sessionExperiments = v7;

    v4 = v9;
    sessionExperiments = self->_sessionExperiments;
  }
  objc_msgSend_addObject_(sessionExperiments, v4, (uint64_t)v4, v5);

}

- (unint64_t)sessionExperimentsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_sessionExperiments, a2, v2, v3);
}

- (id)sessionExperimentsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_sessionExperiments, a2, a3, v3);
}

+ (Class)sessionExperimentsType
{
  return (Class)objc_opt_class();
}

- (void)clearMaterials
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_materials, a2, v2, v3);
}

- (void)addMaterials:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *materials;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  materials = self->_materials;
  v9 = (char *)v4;
  if (!materials)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_materials;
    self->_materials = v7;

    v4 = v9;
    materials = self->_materials;
  }
  objc_msgSend_addObject_(materials, v4, (uint64_t)v4, v5);

}

- (unint64_t)materialsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_materials, a2, v2, v3);
}

- (id)materialsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_materials, a2, a3, v3);
}

+ (Class)materialsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoAllocBindRequest;
  -[IDSQRProtoAllocBindRequest description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  const char *v5;
  void *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  NSString *clientOsVersion;
  NSString *clientHwVersion;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  id v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  const char *v30;
  double v31;
  void *v32;
  NSMutableArray *v33;
  const char *v34;
  double v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  $6ED8184BF6C186D3D086A5ADEA9C2B68 has;
  void *v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  id v58;
  const char *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  const char *v63;
  double v64;
  void *v65;
  NSMutableArray *v66;
  const char *v67;
  double v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  void *v81;
  const char *v82;
  double v83;
  IDSQRProtoMaterial *clientContextBlob;
  void *v85;
  const char *v86;
  double v87;
  int reason;
  __CFString *v89;
  void *v90;
  const char *v91;
  double v92;
  void *v93;
  const char *v94;
  double v95;
  const char *v96;
  double v97;
  NSData *randomSalt;
  NSData *accessToken;
  NSData *serverBlob;
  IDSQRProtoAllocBindTestOption *testOption;
  void *v102;
  const char *v103;
  double v104;
  const char *v105;
  uint64_t v106;
  double v107;
  id v108;
  const char *v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  const char *v113;
  double v114;
  void *v115;
  NSMutableArray *v116;
  const char *v117;
  double v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t k;
  void *v126;
  const char *v127;
  double v128;
  const char *v129;
  double v130;
  id v131;
  const char *v132;
  uint64_t v133;
  double v134;
  uint64_t v135;
  const char *v136;
  double v137;
  void *v138;
  NSMutableArray *v139;
  const char *v140;
  double v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  double v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t m;
  void *v149;
  const char *v150;
  double v151;
  const char *v152;
  double v153;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, self->_serviceId, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, v10, CFSTR("service_id"));

  }
  clientOsVersion = self->_clientOsVersion;
  if (clientOsVersion)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientOsVersion, v7, CFSTR("client_os_version"));
  clientHwVersion = self->_clientHwVersion;
  if (clientHwVersion)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientHwVersion, v7, CFSTR("client_hw_version"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_capabilities, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, v15, CFSTR("capabilities"));

  }
  PBRepeatedUInt32NSArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, v18, CFSTR("published_stream_ids"));

  if (objc_msgSend_count(self->_subscribedStreams, v19, v20, v21))
  {
    v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v29 = objc_msgSend_count(self->_subscribedStreams, v26, v27, v28);
    v32 = (void *)objc_msgSend_initWithCapacity_(v25, v30, v29, v31);
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v33 = self->_subscribedStreams;
    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v167, v35, v174, 16);
    if (v36)
    {
      v40 = v36;
      v41 = *(_QWORD *)v168;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v168 != v41)
            objc_enumerationMutation(v33);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v167 + 1) + 8 * i), v37, v38, v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v32, v44, (uint64_t)v43, v45);

        }
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v37, (uint64_t)&v167, v39, v174, 16);
      }
      while (v40);
    }

    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v32, v47, CFSTR("subscribed_streams"));
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v22, self->_allWildcardSubscription, v24);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v94, (uint64_t)v93, v95, CFSTR("all_wildcard_subscription"));

  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_20:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v22, self->_maxConcurrentStreams, v24);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v50, (uint64_t)v49, v51, CFSTR("max_concurrent_streams"));

    *(_BYTE *)&has = self->_has;
  }
LABEL_21:
  if ((*(_BYTE *)&has & 2) == 0)
  {
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v22, self->_channelBindingInfo, v24);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v91, (uint64_t)v90, v92, CFSTR("channel_binding_info"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_23:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v22, self->_maxEmbeddedStatsResponseDelay, v24);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v53, (uint64_t)v52, v54, CFSTR("max_embedded_stats_response_delay"));

  }
LABEL_24:
  if (objc_msgSend_count(self->_quicConnectionInfos, v22, v23, v24))
  {
    v58 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v62 = objc_msgSend_count(self->_quicConnectionInfos, v59, v60, v61);
    v65 = (void *)objc_msgSend_initWithCapacity_(v58, v63, v62, v64);
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v66 = self->_quicConnectionInfos;
    v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v163, v68, v173, 16);
    if (v69)
    {
      v73 = v69;
      v74 = *(_QWORD *)v164;
      do
      {
        for (j = 0; j != v73; ++j)
        {
          if (*(_QWORD *)v164 != v74)
            objc_enumerationMutation(v66);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v163 + 1) + 8 * j), v70, v71, v72);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v65, v77, (uint64_t)v76, v78);

        }
        v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v70, (uint64_t)&v163, v72, v173, 16);
      }
      while (v73);
    }

    objc_msgSend_setObject_forKey_(v6, v79, (uint64_t)v65, v80, CFSTR("quic_connection_info"));
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v55, self->_stateFlags, v57);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v82, (uint64_t)v81, v83, CFSTR("state_flags"));

  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    objc_msgSend_dictionaryRepresentation(clientContextBlob, v55, v56, v57);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v86, (uint64_t)v85, v87, CFSTR("client_context_blob"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    reason = self->_reason;
    if (reason)
    {
      if (reason == 1)
      {
        v89 = CFSTR("NEWLY_JOINED");
        objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)CFSTR("NEWLY_JOINED"), v57, CFSTR("reason"));
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v55, (uint64_t)CFSTR("(unknown: %i)"), v57, self->_reason);
        v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v96, (uint64_t)v89, v97, CFSTR("reason"));
      }
    }
    else
    {
      v89 = CFSTR("NONE");
      objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)CFSTR("NONE"), v57, CFSTR("reason"));
    }

  }
  randomSalt = self->_randomSalt;
  if (randomSalt)
    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)randomSalt, v57, CFSTR("random_salt"));
  accessToken = self->_accessToken;
  if (accessToken)
    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)accessToken, v57, CFSTR("access_token"));
  serverBlob = self->_serverBlob;
  if (serverBlob)
    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)serverBlob, v57, CFSTR("server_blob"));
  testOption = self->_testOption;
  if (testOption)
  {
    objc_msgSend_dictionaryRepresentation(testOption, v55, (uint64_t)serverBlob, v57);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v103, (uint64_t)v102, v104, CFSTR("test_option"));

  }
  if (objc_msgSend_count(self->_sessionExperiments, v55, (uint64_t)serverBlob, v57))
  {
    v108 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v112 = objc_msgSend_count(self->_sessionExperiments, v109, v110, v111);
    v115 = (void *)objc_msgSend_initWithCapacity_(v108, v113, v112, v114);
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v116 = self->_sessionExperiments;
    v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v117, (uint64_t)&v159, v118, v172, 16);
    if (v119)
    {
      v123 = v119;
      v124 = *(_QWORD *)v160;
      do
      {
        for (k = 0; k != v123; ++k)
        {
          if (*(_QWORD *)v160 != v124)
            objc_enumerationMutation(v116);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v159 + 1) + 8 * k), v120, v121, v122);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v115, v127, (uint64_t)v126, v128);

        }
        v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v120, (uint64_t)&v159, v122, v172, 16);
      }
      while (v123);
    }

    objc_msgSend_setObject_forKey_(v6, v129, (uint64_t)v115, v130, CFSTR("session_experiments"));
  }
  if (objc_msgSend_count(self->_materials, v105, v106, v107))
  {
    v131 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v135 = objc_msgSend_count(self->_materials, v132, v133, v134);
    v138 = (void *)objc_msgSend_initWithCapacity_(v131, v136, v135, v137);
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v139 = self->_materials;
    v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v140, (uint64_t)&v155, v141, v171, 16);
    if (v142)
    {
      v146 = v142;
      v147 = *(_QWORD *)v156;
      do
      {
        for (m = 0; m != v146; ++m)
        {
          if (*(_QWORD *)v156 != v147)
            objc_enumerationMutation(v139);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v155 + 1) + 8 * m), v143, v144, v145);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v138, v150, (uint64_t)v149, v151);

        }
        v146 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v143, (uint64_t)&v155, v145, v171, 16);
      }
      while (v146);
    }

    objc_msgSend_setObject_forKey_(v6, v152, (uint64_t)v138, v153, CFSTR("materials"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoAllocBindRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableArray *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const char *v13;
  double v14;
  $6ED8184BF6C186D3D086A5ADEA9C2B68 has;
  NSMutableArray *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  const char *v23;
  double v24;
  NSMutableArray *v25;
  const char *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  const char *v32;
  double v33;
  NSMutableArray *v34;
  const char *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  const char *v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_clientOsVersion)
    PBDataWriterWriteStringField();
  if (self->_clientHwVersion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_publishedStreamIds.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_publishedStreamIds.count);
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v6 = self->_subscribedStreams;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v55, v8, v62, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v55, v14, v62, 16);
    }
    while (v10);
  }

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_21:
    PBDataWriterWriteUint32Field();
    *(_BYTE *)&has = self->_has;
  }
LABEL_22:
  if ((*(_BYTE *)&has & 2) == 0)
  {
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field();
LABEL_25:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v16 = self->_quicConnectionInfos;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v51, v18, v61, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v52 != v21)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v23, (uint64_t)&v51, v24, v61, 16);
    }
    while (v20);
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_clientContextBlob)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = self->_materials;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v47, v27, v60, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v48 != v30)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v32, (uint64_t)&v47, v33, v60, 16);
    }
    while (v29);
  }

  if (self->_randomSalt)
    PBDataWriterWriteDataField();
  if (self->_accessToken)
    PBDataWriterWriteDataField();
  if (self->_serverBlob)
    PBDataWriterWriteDataField();
  if (self->_testOption)
    PBDataWriterWriteSubmessage();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v34 = self->_sessionExperiments;
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v43, v36, v59, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v34);
        PBDataWriterWriteSubmessage();
      }
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v41, (uint64_t)&v43, v42, v59, 16);
    }
    while (v38);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  double v6;
  NSString *clientOsVersion;
  NSString *clientHwVersion;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  const char *v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  const char *v31;
  double v32;
  $6ED8184BF6C186D3D086A5ADEA9C2B68 has;
  _DWORD *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  const char *v45;
  double v46;
  IDSQRProtoMaterial *clientContextBlob;
  const char *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  void *v57;
  const char *v58;
  double v59;
  NSData *randomSalt;
  NSData *accessToken;
  NSData *serverBlob;
  IDSQRProtoAllocBindTestOption *testOption;
  const char *v64;
  uint64_t v65;
  double v66;
  const char *v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  const char *v71;
  double v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  const char *v76;
  double v77;
  id v78;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v4[32] = self->_serviceId;
    *((_BYTE *)v4 + 172) |= 0x20u;
  }
  clientOsVersion = self->_clientOsVersion;
  v78 = v4;
  if (clientOsVersion)
    objc_msgSend_setClientOsVersion_(v4, v5, (uint64_t)clientOsVersion, v6);
  clientHwVersion = self->_clientHwVersion;
  if (clientHwVersion)
    objc_msgSend_setClientHwVersion_(v78, v5, (uint64_t)clientHwVersion, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v78 + 4) = self->_capabilities;
    *((_BYTE *)v78 + 172) |= 1u;
  }
  if (objc_msgSend_publishedStreamIdsCount(self, v5, (uint64_t)clientHwVersion, v6))
  {
    objc_msgSend_clearPublishedStreamIds(v78, v9, v10, v11);
    v15 = objc_msgSend_publishedStreamIdsCount(self, v12, v13, v14);
    if (v15)
    {
      v16 = v15;
      for (i = 0; i != v16; ++i)
      {
        v18 = objc_msgSend_publishedStreamIdsAtIndex_(self, v9, i, v11);
        objc_msgSend_addPublishedStreamIds_(v78, v19, v18, v20);
      }
    }
  }
  if (objc_msgSend_subscribedStreamsCount(self, v9, v10, v11))
  {
    objc_msgSend_clearSubscribedStreams(v78, v21, v22, v23);
    v27 = objc_msgSend_subscribedStreamsCount(self, v24, v25, v26);
    if (v27)
    {
      v28 = v27;
      for (j = 0; j != v28; ++j)
      {
        objc_msgSend_subscribedStreamsAtIndex_(self, v21, j, v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSubscribedStreams_(v78, v31, (uint64_t)v30, v32);

      }
    }
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    v34 = v78;
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  v34 = v78;
  *((_BYTE *)v78 + 168) = self->_allWildcardSubscription;
  *((_BYTE *)v78 + 172) |= 0x80u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_19:
    v34[22] = self->_maxConcurrentStreams;
    *((_BYTE *)v34 + 172) |= 4u;
    *(_BYTE *)&has = self->_has;
  }
LABEL_20:
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v34[12] = self->_channelBindingInfo;
    *((_BYTE *)v34 + 172) |= 2u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_22:
    v34[23] = self->_maxEmbeddedStatsResponseDelay;
    *((_BYTE *)v34 + 172) |= 8u;
  }
LABEL_23:
  if (objc_msgSend_quicConnectionInfosCount(self, v21, v22, v23))
  {
    objc_msgSend_clearQuicConnectionInfos(v78, v35, v36, v37);
    v41 = objc_msgSend_quicConnectionInfosCount(self, v38, v39, v40);
    if (v41)
    {
      v42 = v41;
      for (k = 0; k != v42; ++k)
      {
        objc_msgSend_quicConnectionInfoAtIndex_(self, v35, k, v37);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addQuicConnectionInfo_(v78, v45, (uint64_t)v44, v46);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v78 + 36) = self->_stateFlags;
    *((_BYTE *)v78 + 172) |= 0x40u;
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
    objc_msgSend_setClientContextBlob_(v78, v35, (uint64_t)clientContextBlob, v37);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v78 + 28) = self->_reason;
    *((_BYTE *)v78 + 172) |= 0x10u;
  }
  if (objc_msgSend_materialsCount(self, v35, (uint64_t)clientContextBlob, v37))
  {
    objc_msgSend_clearMaterials(v78, v48, v49, v50);
    v54 = objc_msgSend_materialsCount(self, v51, v52, v53);
    if (v54)
    {
      v55 = v54;
      for (m = 0; m != v55; ++m)
      {
        objc_msgSend_materialsAtIndex_(self, v48, m, v50);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addMaterials_(v78, v58, (uint64_t)v57, v59);

      }
    }
  }
  randomSalt = self->_randomSalt;
  if (randomSalt)
    objc_msgSend_setRandomSalt_(v78, v48, (uint64_t)randomSalt, v50);
  accessToken = self->_accessToken;
  if (accessToken)
    objc_msgSend_setAccessToken_(v78, v48, (uint64_t)accessToken, v50);
  serverBlob = self->_serverBlob;
  if (serverBlob)
    objc_msgSend_setServerBlob_(v78, v48, (uint64_t)serverBlob, v50);
  testOption = self->_testOption;
  if (testOption)
    objc_msgSend_setTestOption_(v78, v48, (uint64_t)testOption, v50);
  if (objc_msgSend_sessionExperimentsCount(self, v48, (uint64_t)testOption, v50))
  {
    objc_msgSend_clearSessionExperiments(v78, v64, v65, v66);
    v70 = objc_msgSend_sessionExperimentsCount(self, v67, v68, v69);
    if (v70)
    {
      v73 = v70;
      for (n = 0; n != v73; ++n)
      {
        objc_msgSend_sessionExperimentsAtIndex_(self, v71, n, v72);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSessionExperiments_(v78, v76, (uint64_t)v75, v77);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  const char *v32;
  double v33;
  $6ED8184BF6C186D3D086A5ADEA9C2B68 has;
  NSMutableArray *v35;
  const char *v36;
  double v37;
  uint64_t v38;
  const char *v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  uint64_t v49;
  void *v50;
  NSMutableArray *v51;
  const char *v52;
  double v53;
  uint64_t v54;
  const char *v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  const char *v61;
  double v62;
  const char *v63;
  double v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  double v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  double v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  double v76;
  uint64_t v77;
  void *v78;
  NSMutableArray *v79;
  const char *v80;
  double v81;
  uint64_t v82;
  const char *v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t m;
  void *v88;
  const char *v89;
  double v90;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = v12;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v12 + 128) = self->_serviceId;
    *(_BYTE *)(v12 + 172) |= 0x20u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_clientOsVersion, v13, (uint64_t)a3, v14);
  v17 = *(void **)(v15 + 72);
  *(_QWORD *)(v15 + 72) = v16;

  v20 = objc_msgSend_copyWithZone_(self->_clientHwVersion, v18, (uint64_t)a3, v19);
  v21 = *(void **)(v15 + 64);
  *(_QWORD *)(v15 + 64) = v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v15 + 32) = self->_capabilities;
    *(_BYTE *)(v15 + 172) |= 1u;
  }
  PBRepeatedUInt32Copy();
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v22 = self->_subscribedStreams;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v104, v24, v111, 16);
  if (v25)
  {
    v28 = v25;
    v29 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v105 != v29)
          objc_enumerationMutation(v22);
        v31 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v104 + 1) + 8 * i), v26, (uint64_t)a3, v27);
        objc_msgSend_addSubscribedStreams_((void *)v15, v32, (uint64_t)v31, v33);

      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v26, (uint64_t)&v104, v27, v111, 16);
    }
    while (v28);
  }

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *(_BYTE *)(v15 + 168) = self->_allWildcardSubscription;
  *(_BYTE *)(v15 + 172) |= 0x80u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_14:
    *(_DWORD *)(v15 + 88) = self->_maxConcurrentStreams;
    *(_BYTE *)(v15 + 172) |= 4u;
    *(_BYTE *)&has = self->_has;
  }
LABEL_15:
  if ((*(_BYTE *)&has & 2) == 0)
  {
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  *(_DWORD *)(v15 + 48) = self->_channelBindingInfo;
  *(_BYTE *)(v15 + 172) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_17:
    *(_DWORD *)(v15 + 92) = self->_maxEmbeddedStatsResponseDelay;
    *(_BYTE *)(v15 + 172) |= 8u;
  }
LABEL_18:
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v35 = self->_quicConnectionInfos;
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v100, v37, v110, 16);
  if (v38)
  {
    v41 = v38;
    v42 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v101 != v42)
          objc_enumerationMutation(v35);
        v44 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v100 + 1) + 8 * j), v39, (uint64_t)a3, v40);
        objc_msgSend_addQuicConnectionInfo_((void *)v15, v45, (uint64_t)v44, v46);

      }
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v39, (uint64_t)&v100, v40, v110, 16);
    }
    while (v41);
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v15 + 144) = self->_stateFlags;
    *(_BYTE *)(v15 + 172) |= 0x40u;
  }
  v49 = objc_msgSend_copyWithZone_(self->_clientContextBlob, v47, (uint64_t)a3, v48);
  v50 = *(void **)(v15 + 56);
  *(_QWORD *)(v15 + 56) = v49;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v15 + 112) = self->_reason;
    *(_BYTE *)(v15 + 172) |= 0x10u;
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v51 = self->_materials;
  v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v96, v53, v109, 16);
  if (v54)
  {
    v57 = v54;
    v58 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v57; ++k)
      {
        if (*(_QWORD *)v97 != v58)
          objc_enumerationMutation(v51);
        v60 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v96 + 1) + 8 * k), v55, (uint64_t)a3, v56);
        objc_msgSend_addMaterials_((void *)v15, v61, (uint64_t)v60, v62);

      }
      v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v55, (uint64_t)&v96, v56, v109, 16);
    }
    while (v57);
  }

  v65 = objc_msgSend_copyWithZone_(self->_randomSalt, v63, (uint64_t)a3, v64);
  v66 = *(void **)(v15 + 104);
  *(_QWORD *)(v15 + 104) = v65;

  v69 = objc_msgSend_copyWithZone_(self->_accessToken, v67, (uint64_t)a3, v68);
  v70 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v69;

  v73 = objc_msgSend_copyWithZone_(self->_serverBlob, v71, (uint64_t)a3, v72);
  v74 = *(void **)(v15 + 120);
  *(_QWORD *)(v15 + 120) = v73;

  v77 = objc_msgSend_copyWithZone_(self->_testOption, v75, (uint64_t)a3, v76);
  v78 = *(void **)(v15 + 160);
  *(_QWORD *)(v15 + 160) = v77;

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v79 = self->_sessionExperiments;
  v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v92, v81, v108, 16);
  if (v82)
  {
    v85 = v82;
    v86 = *(_QWORD *)v93;
    do
    {
      for (m = 0; m != v85; ++m)
      {
        if (*(_QWORD *)v93 != v86)
          objc_enumerationMutation(v79);
        v88 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v92 + 1) + 8 * m), v83, (uint64_t)a3, v84, (_QWORD)v92);
        objc_msgSend_addSessionExperiments_((void *)v15, v89, (uint64_t)v88, v90);

      }
      v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v83, (uint64_t)&v92, v84, v108, 16);
    }
    while (v85);
  }

  return (id)v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSString *clientOsVersion;
  uint64_t v11;
  NSString *clientHwVersion;
  uint64_t v13;
  const char *v14;
  double v15;
  NSMutableArray *subscribedStreams;
  uint64_t v17;
  $6ED8184BF6C186D3D086A5ADEA9C2B68 has;
  NSMutableArray *quicConnectionInfos;
  uint64_t v20;
  IDSQRProtoMaterial *clientContextBlob;
  uint64_t v22;
  NSMutableArray *materials;
  uint64_t v24;
  NSData *randomSalt;
  uint64_t v26;
  NSData *accessToken;
  uint64_t v28;
  NSData *serverBlob;
  uint64_t v30;
  IDSQRProtoAllocBindTestOption *testOption;
  uint64_t v32;
  NSMutableArray *sessionExperiments;
  uint64_t v34;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_70;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 0x20) == 0 || self->_serviceId != *((_DWORD *)v4 + 32))
      goto LABEL_70;
  }
  else if ((*((_BYTE *)v4 + 172) & 0x20) != 0)
  {
    goto LABEL_70;
  }
  clientOsVersion = self->_clientOsVersion;
  v11 = v4[9];
  if ((unint64_t)clientOsVersion | v11 && !objc_msgSend_isEqual_(clientOsVersion, v8, v11, v9))
    goto LABEL_70;
  clientHwVersion = self->_clientHwVersion;
  v13 = v4[8];
  if ((unint64_t)clientHwVersion | v13)
  {
    if (!objc_msgSend_isEqual_(clientHwVersion, v8, v13, v9))
      goto LABEL_70;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 1) == 0 || self->_capabilities != v4[4])
      goto LABEL_70;
  }
  else if ((*((_BYTE *)v4 + 172) & 1) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_70;
  subscribedStreams = self->_subscribedStreams;
  v17 = v4[19];
  if ((unint64_t)subscribedStreams | v17)
  {
    if (!objc_msgSend_isEqual_(subscribedStreams, v14, v17, v15))
      goto LABEL_70;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 0x80) == 0)
      goto LABEL_70;
    if (self->_allWildcardSubscription)
    {
      if (!*((_BYTE *)v4 + 168))
        goto LABEL_70;
    }
    else if (*((_BYTE *)v4 + 168))
    {
      goto LABEL_70;
    }
  }
  else if ((*((_BYTE *)v4 + 172) & 0x80) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 4) == 0 || self->_maxConcurrentStreams != *((_DWORD *)v4 + 22))
      goto LABEL_70;
  }
  else if ((*((_BYTE *)v4 + 172) & 4) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 2) == 0 || self->_channelBindingInfo != *((_DWORD *)v4 + 12))
      goto LABEL_70;
  }
  else if ((*((_BYTE *)v4 + 172) & 2) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 8) == 0 || self->_maxEmbeddedStatsResponseDelay != *((_DWORD *)v4 + 23))
      goto LABEL_70;
  }
  else if ((*((_BYTE *)v4 + 172) & 8) != 0)
  {
    goto LABEL_70;
  }
  quicConnectionInfos = self->_quicConnectionInfos;
  v20 = v4[12];
  if ((unint64_t)quicConnectionInfos | v20)
  {
    if (!objc_msgSend_isEqual_(quicConnectionInfos, v14, v20, v15))
      goto LABEL_70;
    *(_BYTE *)&has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 0x40) == 0 || self->_stateFlags != *((_DWORD *)v4 + 36))
      goto LABEL_70;
  }
  else if ((*((_BYTE *)v4 + 172) & 0x40) != 0)
  {
    goto LABEL_70;
  }
  clientContextBlob = self->_clientContextBlob;
  v22 = v4[7];
  if ((unint64_t)clientContextBlob | v22)
  {
    if (objc_msgSend_isEqual_(clientContextBlob, v14, v22, v15))
    {
      *(_BYTE *)&has = self->_has;
      goto LABEL_53;
    }
LABEL_70:
    isEqual = 0;
    goto LABEL_71;
  }
LABEL_53:
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 0x10) == 0 || self->_reason != *((_DWORD *)v4 + 28))
      goto LABEL_70;
  }
  else if ((*((_BYTE *)v4 + 172) & 0x10) != 0)
  {
    goto LABEL_70;
  }
  materials = self->_materials;
  v24 = v4[10];
  if ((unint64_t)materials | v24 && !objc_msgSend_isEqual_(materials, v14, v24, v15))
    goto LABEL_70;
  randomSalt = self->_randomSalt;
  v26 = v4[13];
  if ((unint64_t)randomSalt | v26)
  {
    if (!objc_msgSend_isEqual_(randomSalt, v14, v26, v15))
      goto LABEL_70;
  }
  accessToken = self->_accessToken;
  v28 = v4[5];
  if ((unint64_t)accessToken | v28)
  {
    if (!objc_msgSend_isEqual_(accessToken, v14, v28, v15))
      goto LABEL_70;
  }
  serverBlob = self->_serverBlob;
  v30 = v4[15];
  if ((unint64_t)serverBlob | v30)
  {
    if (!objc_msgSend_isEqual_(serverBlob, v14, v30, v15))
      goto LABEL_70;
  }
  testOption = self->_testOption;
  v32 = v4[20];
  if ((unint64_t)testOption | v32)
  {
    if (!objc_msgSend_isEqual_(testOption, v14, v32, v15))
      goto LABEL_70;
  }
  sessionExperiments = self->_sessionExperiments;
  v34 = v4[17];
  if ((unint64_t)sessionExperiments | v34)
    isEqual = objc_msgSend_isEqual_(sessionExperiments, v14, v34, v15);
  else
    isEqual = 1;
LABEL_71:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  double v52;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v55 = 2654435761 * self->_serviceId;
  else
    v55 = 0;
  v5 = objc_msgSend_hash(self->_clientOsVersion, a2, v2, v3);
  v58 = objc_msgSend_hash(self->_clientHwVersion, v6, v7, v8);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v54 = 2654435761u * self->_capabilities;
  else
    v54 = 0;
  v9 = PBRepeatedUInt32Hash();
  v13 = objc_msgSend_hash(self->_subscribedStreams, v10, v11, v12);
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
LABEL_12:
    v18 = 2654435761 * self->_maxConcurrentStreams;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_10;
    goto LABEL_13;
  }
  v17 = 2654435761 * self->_allWildcardSubscription;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_12;
LABEL_9:
  v18 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    v19 = 2654435761 * self->_channelBindingInfo;
    goto LABEL_14;
  }
LABEL_13:
  v19 = 0;
LABEL_14:
  v56 = v19;
  v57 = v18;
  v20 = v13;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v21 = 2654435761 * self->_maxEmbeddedStatsResponseDelay;
  else
    v21 = 0;
  v24 = objc_msgSend_hash(self->_quicConnectionInfos, v14, v15, v16);
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v26 = 2654435761 * self->_stateFlags;
  else
    v26 = 0;
  v27 = objc_msgSend_hash(self->_clientContextBlob, v22, v23, v25);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v31 = 2654435761 * self->_reason;
  else
    v31 = 0;
  v32 = v5 ^ v55 ^ v58 ^ v54 ^ v9 ^ v20 ^ v17 ^ v57 ^ v56 ^ v21 ^ v24 ^ v26 ^ v27;
  v33 = v31 ^ objc_msgSend_hash(self->_materials, v28, v29, v30);
  v37 = v33 ^ objc_msgSend_hash(self->_randomSalt, v34, v35, v36);
  v41 = v37 ^ objc_msgSend_hash(self->_accessToken, v38, v39, v40);
  v45 = v32 ^ v41 ^ objc_msgSend_hash(self->_serverBlob, v42, v43, v44);
  v49 = objc_msgSend_hash(self->_testOption, v46, v47, v48);
  return v45 ^ v49 ^ objc_msgSend_hash(self->_sessionExperiments, v50, v51, v52);
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  const char *v5;
  double v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  const char *v16;
  double v17;
  id v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  int v27;
  id v28;
  const char *v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  const char *v37;
  double v38;
  IDSQRProtoMaterial *clientContextBlob;
  uint64_t v40;
  id v41;
  const char *v42;
  double v43;
  uint64_t v44;
  const char *v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  const char *v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  IDSQRProtoAllocBindTestOption *testOption;
  uint64_t v56;
  id v57;
  const char *v58;
  double v59;
  uint64_t v60;
  const char *v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t n;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  v7 = v4;
  if ((v4[172] & 0x20) != 0)
  {
    self->_serviceId = *((_DWORD *)v4 + 32);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  v8 = *((_QWORD *)v4 + 9);
  if (v8)
    objc_msgSend_setClientOsVersion_(self, v5, v8, v6);
  v9 = *((_QWORD *)v7 + 8);
  if (v9)
    objc_msgSend_setClientHwVersion_(self, v5, v9, v6);
  if ((v7[172] & 1) != 0)
  {
    self->_capabilities = *((_QWORD *)v7 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v10 = objc_msgSend_publishedStreamIdsCount(v7, v5, v9, v6);
  if (v10)
  {
    v13 = v10;
    for (i = 0; i != v13; ++i)
    {
      v15 = objc_msgSend_publishedStreamIdsAtIndex_(v7, v11, i, v12);
      objc_msgSend_addPublishedStreamIds_(self, v16, v15, v17);
    }
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v18 = *((id *)v7 + 19);
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v78, v20, v85, 16);
  if (v21)
  {
    v24 = v21;
    v25 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v79 != v25)
          objc_enumerationMutation(v18);
        objc_msgSend_addSubscribedStreams_(self, v22, *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j), v23);
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v78, v23, v85, 16);
    }
    while (v24);
  }

  v27 = v7[172];
  if ((v27 & 0x80000000) == 0)
  {
    if ((v27 & 4) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  self->_allWildcardSubscription = v7[168];
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v27) = v7[172];
  if ((v27 & 4) != 0)
  {
LABEL_21:
    self->_maxConcurrentStreams = *((_DWORD *)v7 + 22);
    *(_BYTE *)&self->_has |= 4u;
    LOBYTE(v27) = v7[172];
  }
LABEL_22:
  if ((v27 & 2) == 0)
  {
    if ((v27 & 8) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  self->_channelBindingInfo = *((_DWORD *)v7 + 12);
  *(_BYTE *)&self->_has |= 2u;
  if ((v7[172] & 8) != 0)
  {
LABEL_24:
    self->_maxEmbeddedStatsResponseDelay = *((_DWORD *)v7 + 23);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_25:
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v28 = *((id *)v7 + 12);
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v74, v30, v84, 16);
  if (v31)
  {
    v34 = v31;
    v35 = *(_QWORD *)v75;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v75 != v35)
          objc_enumerationMutation(v28);
        objc_msgSend_addQuicConnectionInfo_(self, v32, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k), v33);
      }
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v32, (uint64_t)&v74, v33, v84, 16);
    }
    while (v34);
  }

  if ((v7[172] & 0x40) != 0)
  {
    self->_stateFlags = *((_DWORD *)v7 + 36);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  clientContextBlob = self->_clientContextBlob;
  v40 = *((_QWORD *)v7 + 7);
  if (clientContextBlob)
  {
    if (v40)
      objc_msgSend_mergeFrom_(clientContextBlob, v37, v40, v38);
  }
  else if (v40)
  {
    objc_msgSend_setClientContextBlob_(self, v37, v40, v38);
  }
  if ((v7[172] & 0x10) != 0)
  {
    self->_reason = *((_DWORD *)v7 + 28);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v41 = *((id *)v7 + 10);
  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v70, v43, v83, 16);
  if (v44)
  {
    v47 = v44;
    v48 = *(_QWORD *)v71;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v71 != v48)
          objc_enumerationMutation(v41);
        objc_msgSend_addMaterials_(self, v45, *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * m), v46);
      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v45, (uint64_t)&v70, v46, v83, 16);
    }
    while (v47);
  }

  v52 = *((_QWORD *)v7 + 13);
  if (v52)
    objc_msgSend_setRandomSalt_(self, v50, v52, v51);
  v53 = *((_QWORD *)v7 + 5);
  if (v53)
    objc_msgSend_setAccessToken_(self, v50, v53, v51);
  v54 = *((_QWORD *)v7 + 15);
  if (v54)
    objc_msgSend_setServerBlob_(self, v50, v54, v51);
  testOption = self->_testOption;
  v56 = *((_QWORD *)v7 + 20);
  if (testOption)
  {
    if (v56)
      objc_msgSend_mergeFrom_(testOption, v50, v56, v51);
  }
  else if (v56)
  {
    objc_msgSend_setTestOption_(self, v50, v56, v51);
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v57 = *((id *)v7 + 17);
  v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v66, v59, v82, 16);
  if (v60)
  {
    v63 = v60;
    v64 = *(_QWORD *)v67;
    do
    {
      for (n = 0; n != v63; ++n)
      {
        if (*(_QWORD *)v67 != v64)
          objc_enumerationMutation(v57);
        objc_msgSend_addSessionExperiments_(self, v61, *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * n), v62, (_QWORD)v66);
      }
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v61, (uint64_t)&v66, v62, v82, 16);
    }
    while (v63);
  }

}

- (unsigned)serviceId
{
  return self->_serviceId;
}

- (NSString)clientOsVersion
{
  return self->_clientOsVersion;
}

- (void)setClientOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientOsVersion, a3);
}

- (NSString)clientHwVersion
{
  return self->_clientHwVersion;
}

- (void)setClientHwVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientHwVersion, a3);
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (NSMutableArray)subscribedStreams
{
  return self->_subscribedStreams;
}

- (void)setSubscribedStreams:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedStreams, a3);
}

- (BOOL)allWildcardSubscription
{
  return self->_allWildcardSubscription;
}

- (unsigned)maxConcurrentStreams
{
  return self->_maxConcurrentStreams;
}

- (unsigned)channelBindingInfo
{
  return self->_channelBindingInfo;
}

- (unsigned)maxEmbeddedStatsResponseDelay
{
  return self->_maxEmbeddedStatsResponseDelay;
}

- (NSMutableArray)quicConnectionInfos
{
  return self->_quicConnectionInfos;
}

- (void)setQuicConnectionInfos:(id)a3
{
  objc_storeStrong((id *)&self->_quicConnectionInfos, a3);
}

- (unsigned)stateFlags
{
  return self->_stateFlags;
}

- (IDSQRProtoMaterial)clientContextBlob
{
  return self->_clientContextBlob;
}

- (void)setClientContextBlob:(id)a3
{
  objc_storeStrong((id *)&self->_clientContextBlob, a3);
}

- (NSData)randomSalt
{
  return self->_randomSalt;
}

- (void)setRandomSalt:(id)a3
{
  objc_storeStrong((id *)&self->_randomSalt, a3);
}

- (NSData)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
  objc_storeStrong((id *)&self->_accessToken, a3);
}

- (NSData)serverBlob
{
  return self->_serverBlob;
}

- (void)setServerBlob:(id)a3
{
  objc_storeStrong((id *)&self->_serverBlob, a3);
}

- (IDSQRProtoAllocBindTestOption)testOption
{
  return self->_testOption;
}

- (void)setTestOption:(id)a3
{
  objc_storeStrong((id *)&self->_testOption, a3);
}

- (NSMutableArray)sessionExperiments
{
  return self->_sessionExperiments;
}

- (void)setSessionExperiments:(id)a3
{
  objc_storeStrong((id *)&self->_sessionExperiments, a3);
}

- (NSMutableArray)materials
{
  return self->_materials;
}

- (void)setMaterials:(id)a3
{
  objc_storeStrong((id *)&self->_materials, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOption, 0);
  objc_storeStrong((id *)&self->_subscribedStreams, 0);
  objc_storeStrong((id *)&self->_sessionExperiments, 0);
  objc_storeStrong((id *)&self->_serverBlob, 0);
  objc_storeStrong((id *)&self->_randomSalt, 0);
  objc_storeStrong((id *)&self->_quicConnectionInfos, 0);
  objc_storeStrong((id *)&self->_materials, 0);
  objc_storeStrong((id *)&self->_clientOsVersion, 0);
  objc_storeStrong((id *)&self->_clientHwVersion, 0);
  objc_storeStrong((id *)&self->_clientContextBlob, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end
