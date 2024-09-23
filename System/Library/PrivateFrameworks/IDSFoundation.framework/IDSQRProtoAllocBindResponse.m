@implementation IDSQRProtoAllocBindResponse

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoAllocBindResponse;
  -[IDSQRProtoAllocBindResponse dealloc](&v3, sel_dealloc);
}

- (BOOL)hasSoftware
{
  return self->_software != 0;
}

- (void)clearPeerPublishedStreams
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_peerPublishedStreams, a2, v2, v3);
}

- (void)addPeerPublishedStreams:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *peerPublishedStreams;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  peerPublishedStreams = self->_peerPublishedStreams;
  v9 = (char *)v4;
  if (!peerPublishedStreams)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_peerPublishedStreams;
    self->_peerPublishedStreams = v7;

    v4 = v9;
    peerPublishedStreams = self->_peerPublishedStreams;
  }
  objc_msgSend_addObject_(peerPublishedStreams, v4, (uint64_t)v4, v5);

}

- (unint64_t)peerPublishedStreamsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_peerPublishedStreams, a2, v2, v3);
}

- (id)peerPublishedStreamsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_peerPublishedStreams, a2, a3, v3);
}

+ (Class)peerPublishedStreamsType
{
  return (Class)objc_opt_class();
}

- (unint64_t)peerSubscribedStreamIdsCount
{
  return self->_peerSubscribedStreamIds.count;
}

- (unsigned)peerSubscribedStreamIds
{
  return self->_peerSubscribedStreamIds.list;
}

- (void)clearPeerSubscribedStreamIds
{
  PBRepeatedUInt32Clear();
}

- (void)addPeerSubscribedStreamIds:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)peerSubscribedStreamIdsAtIndex:(unint64_t)a3
{
  double v3;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_peerSubscribedStreamIds;
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

  p_peerSubscribedStreamIds = &self->_peerSubscribedStreamIds;
  count = self->_peerSubscribedStreamIds.count;
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
  return p_peerSubscribedStreamIds->list[a3];
}

- (void)setPeerSubscribedStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setLinkId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_linkId = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLinkId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setChannelSettings:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelSettings = a3;
}

- (void)setHasChannelSettings:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelSettings
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasReportingDataBlob
{
  return self->_reportingDataBlob != 0;
}

- (unint64_t)lightweightParticipantIdListsCount
{
  return self->_lightweightParticipantIdLists.count;
}

- (unint64_t)lightweightParticipantIdLists
{
  return self->_lightweightParticipantIdLists.list;
}

- (void)clearLightweightParticipantIdLists
{
  PBRepeatedUInt64Clear();
}

- (void)addLightweightParticipantIdList:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)lightweightParticipantIdListAtIndex:(unint64_t)a3
{
  double v3;
  $D9041E0417540B7714261C3B5E8BB314 *p_lightweightParticipantIdLists;
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

  p_lightweightParticipantIdLists = &self->_lightweightParticipantIdLists;
  count = self->_lightweightParticipantIdLists.count;
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
  return p_lightweightParticipantIdLists->list[a3];
}

- (void)setLightweightParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
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

- (void)setParticipantType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_participantType = a3;
}

- (void)setHasParticipantType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasParticipantType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setGenerationCounter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_generationCounter = a3;
}

- (void)setHasGenerationCounter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenerationCounter
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSessionStateCounter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sessionStateCounter = a3;
}

- (void)setHasSessionStateCounter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSessionStateCounter
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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

- (void)clearActiveExperiments
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_activeExperiments, a2, v2, v3);
}

- (void)addActiveExperiments:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *activeExperiments;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  activeExperiments = self->_activeExperiments;
  v9 = (char *)v4;
  if (!activeExperiments)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_activeExperiments;
    self->_activeExperiments = v7;

    v4 = v9;
    activeExperiments = self->_activeExperiments;
  }
  objc_msgSend_addObject_(activeExperiments, v4, (uint64_t)v4, v5);

}

- (unint64_t)activeExperimentsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_activeExperiments, a2, v2, v3);
}

- (id)activeExperimentsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_activeExperiments, a2, a3, v3);
}

+ (Class)activeExperimentsType
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
  v13.super_class = (Class)IDSQRProtoAllocBindResponse;
  -[IDSQRProtoAllocBindResponse description](&v13, sel_description);
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
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  NSString *clientAddress;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  NSString *software;
  id v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  NSMutableArray *v24;
  const char *v25;
  double v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  char has;
  void *v45;
  const char *v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;
  NSData *reportingDataBlob;
  void *v52;
  const char *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  const char *v58;
  uint64_t v59;
  double v60;
  id v61;
  const char *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  const char *v66;
  double v67;
  void *v68;
  NSMutableArray *v69;
  const char *v70;
  double v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  char v84;
  void *v85;
  const char *v86;
  double v87;
  const char *v88;
  uint64_t v89;
  double v90;
  id v91;
  const char *v92;
  uint64_t v93;
  double v94;
  uint64_t v95;
  const char *v96;
  double v97;
  void *v98;
  NSMutableArray *v99;
  const char *v100;
  double v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t k;
  void *v109;
  const char *v110;
  double v111;
  const char *v112;
  double v113;
  id v114;
  const char *v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  const char *v119;
  double v120;
  void *v121;
  NSMutableArray *v122;
  const char *v123;
  double v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  double v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t m;
  void *v132;
  const char *v133;
  double v134;
  const char *v135;
  double v136;
  void *v138;
  const char *v139;
  double v140;
  void *v141;
  const char *v142;
  double v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  clientAddress = self->_clientAddress;
  if (clientAddress)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)clientAddress, v7, CFSTR("client_address"));
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_channelId, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, v12, CFSTR("channel_id"));

  software = self->_software;
  if (software)
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)software, v14, CFSTR("software"));
  if (objc_msgSend_count(self->_peerPublishedStreams, v13, (uint64_t)software, v14))
  {
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v20 = objc_msgSend_count(self->_peerPublishedStreams, v17, v18, v19);
    v23 = (void *)objc_msgSend_initWithCapacity_(v16, v21, v20, v22);
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v24 = self->_peerPublishedStreams;
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v156, v26, v163, 16);
    if (v27)
    {
      v31 = v27;
      v32 = *(_QWORD *)v157;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v157 != v32)
            objc_enumerationMutation(v24);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v156 + 1) + 8 * i), v28, v29, v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v23, v35, (uint64_t)v34, v36);

        }
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v28, (uint64_t)&v156, v30, v163, 16);
      }
      while (v31);
    }

    objc_msgSend_setObject_forKey_(v8, v37, (uint64_t)v23, v38, CFSTR("peer_published_streams"));
  }
  PBRepeatedUInt32NSArray();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v40, (uint64_t)v39, v41, CFSTR("peer_subscribed_stream_ids"));

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v42, self->_linkId, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v46, (uint64_t)v45, v47, CFSTR("link_id"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v42, self->_channelSettings, v43);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v49, (uint64_t)v48, v50, CFSTR("channel_settings"));

  }
  reportingDataBlob = self->_reportingDataBlob;
  if (reportingDataBlob)
    objc_msgSend_setObject_forKey_(v8, v42, (uint64_t)reportingDataBlob, v43, CFSTR("reporting_data_blob"));
  PBRepeatedUInt64NSArray();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v53, (uint64_t)v52, v54, CFSTR("lightweight_participant_id_list"));

  if (objc_msgSend_count(self->_quicConnectionInfos, v55, v56, v57))
  {
    v61 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v65 = objc_msgSend_count(self->_quicConnectionInfos, v62, v63, v64);
    v68 = (void *)objc_msgSend_initWithCapacity_(v61, v66, v65, v67);
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v69 = self->_quicConnectionInfos;
    v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v152, v71, v162, 16);
    if (v72)
    {
      v76 = v72;
      v77 = *(_QWORD *)v153;
      do
      {
        for (j = 0; j != v76; ++j)
        {
          if (*(_QWORD *)v153 != v77)
            objc_enumerationMutation(v69);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v152 + 1) + 8 * j), v73, v74, v75);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v68, v80, (uint64_t)v79, v81);

        }
        v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v73, (uint64_t)&v152, v75, v162, 16);
      }
      while (v76);
    }

    objc_msgSend_setObject_forKey_(v8, v82, (uint64_t)v68, v83, CFSTR("quic_connection_info"));
  }
  v84 = (char)self->_has;
  if ((v84 & 8) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v58, self->_participantType, v60);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v139, (uint64_t)v138, v140, CFSTR("participant_type"));

    v84 = (char)self->_has;
    if ((v84 & 2) == 0)
    {
LABEL_31:
      if ((v84 & 0x10) == 0)
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_31;
  }
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v58, self->_generationCounter, v60);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v142, (uint64_t)v141, v143, CFSTR("generation_counter"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_32:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v58, self->_sessionStateCounter, v60);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v86, (uint64_t)v85, v87, CFSTR("session_state_counter"));

  }
LABEL_33:
  if (objc_msgSend_count(self->_materials, v58, v59, v60))
  {
    v91 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v95 = objc_msgSend_count(self->_materials, v92, v93, v94);
    v98 = (void *)objc_msgSend_initWithCapacity_(v91, v96, v95, v97);
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v99 = self->_materials;
    v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v148, v101, v161, 16);
    if (v102)
    {
      v106 = v102;
      v107 = *(_QWORD *)v149;
      do
      {
        for (k = 0; k != v106; ++k)
        {
          if (*(_QWORD *)v149 != v107)
            objc_enumerationMutation(v99);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v148 + 1) + 8 * k), v103, v104, v105);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v98, v110, (uint64_t)v109, v111);

        }
        v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v103, (uint64_t)&v148, v105, v161, 16);
      }
      while (v106);
    }

    objc_msgSend_setObject_forKey_(v8, v112, (uint64_t)v98, v113, CFSTR("materials"));
  }
  if (objc_msgSend_count(self->_activeExperiments, v88, v89, v90))
  {
    v114 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v118 = objc_msgSend_count(self->_activeExperiments, v115, v116, v117);
    v121 = (void *)objc_msgSend_initWithCapacity_(v114, v119, v118, v120);
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v122 = self->_activeExperiments;
    v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v123, (uint64_t)&v144, v124, v160, 16);
    if (v125)
    {
      v129 = v125;
      v130 = *(_QWORD *)v145;
      do
      {
        for (m = 0; m != v129; ++m)
        {
          if (*(_QWORD *)v145 != v130)
            objc_enumerationMutation(v122);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v144 + 1) + 8 * m), v126, v127, v128, (_QWORD)v144);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v121, v133, (uint64_t)v132, v134);

        }
        v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v126, (uint64_t)&v144, v128, v160, 16);
      }
      while (v129);
    }

    objc_msgSend_setObject_forKey_(v8, v135, (uint64_t)v121, v136, CFSTR("active_experiments"));
  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoAllocBindResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const char *v13;
  double v14;
  unint64_t v15;
  char has;
  unint64_t v17;
  NSMutableArray *v18;
  const char *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  const char *v25;
  double v26;
  NSMutableArray *v27;
  const char *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  const char *v34;
  double v35;
  char v36;
  NSMutableArray *v37;
  const char *v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  const char *v44;
  double v45;
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
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_clientAddress)
    sub_19BAF8634();
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_software)
    PBDataWriterWriteStringField();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v6 = self->_peerPublishedStreams;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v58, v8, v65, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v59 != v11)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v58, v14, v65, 16);
    }
    while (v10);
  }

  if (self->_peerSubscribedStreamIds.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v15;
    }
    while (v15 < self->_peerSubscribedStreamIds.count);
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_reportingDataBlob)
    PBDataWriterWriteDataField();
  if (self->_lightweightParticipantIdLists.count)
  {
    v17 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v17;
    }
    while (v17 < self->_lightweightParticipantIdLists.count);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v18 = self->_quicConnectionInfos;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v54, v20, v64, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v25, (uint64_t)&v54, v26, v64, 16);
    }
    while (v22);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint32Field();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v27 = self->_materials;
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v50, v29, v63, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v27);
        PBDataWriterWriteSubmessage();
      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v34, (uint64_t)&v50, v35, v63, 16);
    }
    while (v31);
  }

  v36 = (char)self->_has;
  if ((v36 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v36 = (char)self->_has;
  }
  if ((v36 & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v37 = self->_activeExperiments;
  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v46, v39, v62, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v41; ++m)
      {
        if (*(_QWORD *)v47 != v42)
          objc_enumerationMutation(v37);
        PBDataWriterWriteSubmessage();
      }
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v44, (uint64_t)&v46, v45, v62, 16);
    }
    while (v41);
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  NSString *software;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
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
  uint64_t v30;
  const char *v31;
  double v32;
  char has;
  NSData *reportingDataBlob;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  const char *v45;
  double v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  const char *v57;
  double v58;
  const char *v59;
  uint64_t v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t n;
  void *v68;
  const char *v69;
  double v70;
  char v71;
  const char *v72;
  uint64_t v73;
  double v74;
  const char *v75;
  uint64_t v76;
  double v77;
  uint64_t active;
  const char *v79;
  double v80;
  uint64_t v81;
  uint64_t ii;
  void *v83;
  const char *v84;
  double v85;
  id v86;

  v86 = a3;
  objc_msgSend_setClientAddress_(v86, v4, (uint64_t)self->_clientAddress, v5);
  *((_DWORD *)v86 + 16) = self->_channelId;
  software = self->_software;
  if (software)
    objc_msgSend_setSoftware_(v86, v6, (uint64_t)software, v7);
  if (objc_msgSend_peerPublishedStreamsCount(self, v6, (uint64_t)software, v7))
  {
    objc_msgSend_clearPeerPublishedStreams(v86, v9, v10, v11);
    v15 = objc_msgSend_peerPublishedStreamsCount(self, v12, v13, v14);
    if (v15)
    {
      v16 = v15;
      for (i = 0; i != v16; ++i)
      {
        objc_msgSend_peerPublishedStreamsAtIndex_(self, v9, i, v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPeerPublishedStreams_(v86, v19, (uint64_t)v18, v20);

      }
    }
  }
  if (objc_msgSend_peerSubscribedStreamIdsCount(self, v9, v10, v11))
  {
    objc_msgSend_clearPeerSubscribedStreamIds(v86, v21, v22, v23);
    v27 = objc_msgSend_peerSubscribedStreamIdsCount(self, v24, v25, v26);
    if (v27)
    {
      v28 = v27;
      for (j = 0; j != v28; ++j)
      {
        v30 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(self, v21, j, v23);
        objc_msgSend_addPeerSubscribedStreamIds_(v86, v31, v30, v32);
      }
    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v86 + 21) = self->_linkId;
    *((_BYTE *)v86 + 144) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v86 + 17) = self->_channelSettings;
    *((_BYTE *)v86 + 144) |= 1u;
  }
  reportingDataBlob = self->_reportingDataBlob;
  if (reportingDataBlob)
    objc_msgSend_setReportingDataBlob_(v86, v21, (uint64_t)reportingDataBlob, v23);
  if (objc_msgSend_lightweightParticipantIdListsCount(self, v21, (uint64_t)reportingDataBlob, v23))
  {
    objc_msgSend_clearLightweightParticipantIdLists(v86, v35, v36, v37);
    v41 = objc_msgSend_lightweightParticipantIdListsCount(self, v38, v39, v40);
    if (v41)
    {
      v42 = v41;
      for (k = 0; k != v42; ++k)
      {
        v44 = objc_msgSend_lightweightParticipantIdListAtIndex_(self, v35, k, v37);
        objc_msgSend_addLightweightParticipantIdList_(v86, v45, v44, v46);
      }
    }
  }
  if (objc_msgSend_quicConnectionInfosCount(self, v35, v36, v37))
  {
    objc_msgSend_clearQuicConnectionInfos(v86, v47, v48, v49);
    v53 = objc_msgSend_quicConnectionInfosCount(self, v50, v51, v52);
    if (v53)
    {
      v54 = v53;
      for (m = 0; m != v54; ++m)
      {
        objc_msgSend_quicConnectionInfoAtIndex_(self, v47, m, v49);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addQuicConnectionInfo_(v86, v57, (uint64_t)v56, v58);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v86 + 24) = self->_participantType;
    *((_BYTE *)v86 + 144) |= 8u;
  }
  if (objc_msgSend_materialsCount(self, v47, v48, v49))
  {
    objc_msgSend_clearMaterials(v86, v59, v60, v61);
    v65 = objc_msgSend_materialsCount(self, v62, v63, v64);
    if (v65)
    {
      v66 = v65;
      for (n = 0; n != v66; ++n)
      {
        objc_msgSend_materialsAtIndex_(self, v59, n, v61);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addMaterials_(v86, v69, (uint64_t)v68, v70);

      }
    }
  }
  v71 = (char)self->_has;
  if ((v71 & 2) != 0)
  {
    *((_DWORD *)v86 + 20) = self->_generationCounter;
    *((_BYTE *)v86 + 144) |= 2u;
    v71 = (char)self->_has;
  }
  if ((v71 & 0x10) != 0)
  {
    *((_DWORD *)v86 + 32) = self->_sessionStateCounter;
    *((_BYTE *)v86 + 144) |= 0x10u;
  }
  if (objc_msgSend_activeExperimentsCount(self, v59, v60, v61))
  {
    objc_msgSend_clearActiveExperiments(v86, v72, v73, v74);
    active = objc_msgSend_activeExperimentsCount(self, v75, v76, v77);
    if (active)
    {
      v81 = active;
      for (ii = 0; ii != v81; ++ii)
      {
        objc_msgSend_activeExperimentsAtIndex_(self, v79, ii, v80);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addActiveExperiments_(v86, v84, (uint64_t)v83, v85);

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
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  const char *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  char has;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  const char *v39;
  double v40;
  uint64_t v41;
  const char *v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  const char *v48;
  double v49;
  NSMutableArray *v50;
  const char *v51;
  double v52;
  uint64_t v53;
  const char *v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  const char *v60;
  double v61;
  char v62;
  NSMutableArray *v63;
  const char *v64;
  double v65;
  uint64_t v66;
  const char *v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  void *v72;
  const char *v73;
  double v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_clientAddress, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 72);
  *(_QWORD *)(v12 + 72) = v15;

  *(_DWORD *)(v12 + 64) = self->_channelId;
  v19 = objc_msgSend_copyWithZone_(self->_software, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 136);
  *(_QWORD *)(v12 + 136) = v19;

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v21 = self->_peerPublishedStreams;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v88, v23, v95, 16);
  if (v24)
  {
    v27 = v24;
    v28 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v89 != v28)
          objc_enumerationMutation(v21);
        v30 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v88 + 1) + 8 * i), v25, (uint64_t)a3, v26);
        objc_msgSend_addPeerPublishedStreams_((void *)v12, v31, (uint64_t)v30, v32);

      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v25, (uint64_t)&v88, v26, v95, 16);
    }
    while (v27);
  }

  PBRepeatedUInt32Copy();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v12 + 84) = self->_linkId;
    *(_BYTE *)(v12 + 144) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v12 + 68) = self->_channelSettings;
    *(_BYTE *)(v12 + 144) |= 1u;
  }
  v36 = objc_msgSend_copyWithZone_(self->_reportingDataBlob, v33, (uint64_t)a3, v34);
  v37 = *(void **)(v12 + 120);
  *(_QWORD *)(v12 + 120) = v36;

  PBRepeatedUInt64Copy();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v38 = self->_quicConnectionInfos;
  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v84, v40, v94, 16);
  if (v41)
  {
    v44 = v41;
    v45 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v85 != v45)
          objc_enumerationMutation(v38);
        v47 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v84 + 1) + 8 * j), v42, (uint64_t)a3, v43);
        objc_msgSend_addQuicConnectionInfo_((void *)v12, v48, (uint64_t)v47, v49);

      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v42, (uint64_t)&v84, v43, v94, 16);
    }
    while (v44);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v12 + 96) = self->_participantType;
    *(_BYTE *)(v12 + 144) |= 8u;
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v50 = self->_materials;
  v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v80, v52, v93, 16);
  if (v53)
  {
    v56 = v53;
    v57 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v56; ++k)
      {
        if (*(_QWORD *)v81 != v57)
          objc_enumerationMutation(v50);
        v59 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v80 + 1) + 8 * k), v54, (uint64_t)a3, v55);
        objc_msgSend_addMaterials_((void *)v12, v60, (uint64_t)v59, v61);

      }
      v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v54, (uint64_t)&v80, v55, v93, 16);
    }
    while (v56);
  }

  v62 = (char)self->_has;
  if ((v62 & 2) != 0)
  {
    *(_DWORD *)(v12 + 80) = self->_generationCounter;
    *(_BYTE *)(v12 + 144) |= 2u;
    v62 = (char)self->_has;
  }
  if ((v62 & 0x10) != 0)
  {
    *(_DWORD *)(v12 + 128) = self->_sessionStateCounter;
    *(_BYTE *)(v12 + 144) |= 0x10u;
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v63 = self->_activeExperiments;
  v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v76, v65, v92, 16);
  if (v66)
  {
    v69 = v66;
    v70 = *(_QWORD *)v77;
    do
    {
      for (m = 0; m != v69; ++m)
      {
        if (*(_QWORD *)v77 != v70)
          objc_enumerationMutation(v63);
        v72 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v76 + 1) + 8 * m), v67, (uint64_t)a3, v68, (_QWORD)v76);
        objc_msgSend_addActiveExperiments_((void *)v12, v73, (uint64_t)v72, v74);

      }
      v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v67, (uint64_t)&v76, v68, v92, 16);
    }
    while (v69);
  }

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSString *clientAddress;
  uint64_t v11;
  NSString *software;
  uint64_t v13;
  NSMutableArray *peerPublishedStreams;
  uint64_t v15;
  const char *v16;
  double v17;
  NSData *reportingDataBlob;
  uint64_t v19;
  const char *v20;
  double v21;
  NSMutableArray *quicConnectionInfos;
  uint64_t v23;
  char has;
  NSMutableArray *materials;
  uint64_t v26;
  NSMutableArray *activeExperiments;
  uint64_t v28;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_45;
  clientAddress = self->_clientAddress;
  v11 = v4[9];
  if ((unint64_t)clientAddress | v11)
  {
    if (!objc_msgSend_isEqual_(clientAddress, v8, v11, v9))
      goto LABEL_45;
  }
  if (self->_channelId != *((_DWORD *)v4 + 16))
    goto LABEL_45;
  software = self->_software;
  v13 = v4[17];
  if ((unint64_t)software | v13)
  {
    if (!objc_msgSend_isEqual_(software, v8, v13, v9))
      goto LABEL_45;
  }
  peerPublishedStreams = self->_peerPublishedStreams;
  v15 = v4[13];
  if ((unint64_t)peerPublishedStreams | v15)
  {
    if (!objc_msgSend_isEqual_(peerPublishedStreams, v8, v15, v9))
      goto LABEL_45;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_45;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[18] & 4) == 0 || self->_linkId != *((_DWORD *)v4 + 21))
      goto LABEL_45;
  }
  else if ((v4[18] & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[18] & 1) == 0 || self->_channelSettings != *((_DWORD *)v4 + 17))
      goto LABEL_45;
  }
  else if ((v4[18] & 1) != 0)
  {
    goto LABEL_45;
  }
  reportingDataBlob = self->_reportingDataBlob;
  v19 = v4[15];
  if ((unint64_t)reportingDataBlob | v19
    && !objc_msgSend_isEqual_(reportingDataBlob, v16, v19, v17))
  {
    goto LABEL_45;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_45;
  quicConnectionInfos = self->_quicConnectionInfos;
  v23 = v4[14];
  if ((unint64_t)quicConnectionInfos | v23)
  {
    if (!objc_msgSend_isEqual_(quicConnectionInfos, v20, v23, v21))
      goto LABEL_45;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((v4[18] & 8) == 0 || self->_participantType != *((_DWORD *)v4 + 24))
      goto LABEL_45;
  }
  else if ((v4[18] & 8) != 0)
  {
    goto LABEL_45;
  }
  materials = self->_materials;
  v26 = v4[11];
  if ((unint64_t)materials | v26)
  {
    if (!objc_msgSend_isEqual_(materials, v20, v26, v21))
    {
LABEL_45:
      isEqual = 0;
      goto LABEL_46;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((v4[18] & 2) == 0 || self->_generationCounter != *((_DWORD *)v4 + 20))
      goto LABEL_45;
  }
  else if ((v4[18] & 2) != 0)
  {
    goto LABEL_45;
  }
  if ((has & 0x10) != 0)
  {
    if ((v4[18] & 0x10) == 0 || self->_sessionStateCounter != *((_DWORD *)v4 + 32))
      goto LABEL_45;
  }
  else if ((v4[18] & 0x10) != 0)
  {
    goto LABEL_45;
  }
  activeExperiments = self->_activeExperiments;
  v28 = v4[7];
  if ((unint64_t)activeExperiments | v28)
    isEqual = objc_msgSend_isEqual_(activeExperiments, v20, v28, v21);
  else
    isEqual = 1;
LABEL_46:

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
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int channelId;
  uint64_t v39;

  v5 = objc_msgSend_hash(self->_clientAddress, a2, v2, v3);
  channelId = self->_channelId;
  v39 = v5;
  v37 = objc_msgSend_hash(self->_software, v6, v7, v8);
  v35 = objc_msgSend_hash(self->_peerPublishedStreams, v9, v10, v11);
  v14 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v16 = 2654435761 * self->_linkId;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v17 = 2654435761 * self->_channelSettings;
      goto LABEL_6;
    }
  }
  v17 = 0;
LABEL_6:
  v18 = objc_msgSend_hash(self->_reportingDataBlob, v12, v13, v15, v35);
  v19 = PBRepeatedUInt64Hash();
  v25 = objc_msgSend_hash(self->_quicConnectionInfos, v20, v21, v22);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v27 = 2654435761 * self->_participantType;
  else
    v27 = 0;
  v28 = objc_msgSend_hash(self->_materials, v23, v24, v26);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v32 = 2654435761 * self->_generationCounter;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_13:
    v33 = 0;
    return (2654435761 * channelId) ^ v39 ^ v37 ^ v36 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v25 ^ v27 ^ v28 ^ v32 ^ v33 ^ objc_msgSend_hash(self->_activeExperiments, v29, v30, v31);
  }
  v32 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_11:
  v33 = 2654435761 * self->_sessionStateCounter;
  return (2654435761 * channelId) ^ v39 ^ v37 ^ v36 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v25 ^ v27 ^ v28 ^ v32 ^ v33 ^ objc_msgSend_hash(self->_activeExperiments, v29, v30, v31);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  const char *v27;
  double v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  double v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  const char *v37;
  double v38;
  id v39;
  const char *v40;
  double v41;
  uint64_t v42;
  const char *v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  id v48;
  const char *v49;
  double v50;
  uint64_t v51;
  const char *v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  char v57;
  id v58;
  const char *v59;
  double v60;
  uint64_t v61;
  const char *v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t ii;
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
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v7 = *((_QWORD *)v5 + 9);
  if (v7)
    objc_msgSend_setClientAddress_(self, v4, v7, v6);
  self->_channelId = *((_DWORD *)v5 + 16);
  v8 = *((_QWORD *)v5 + 17);
  if (v8)
    objc_msgSend_setSoftware_(self, v4, v8, v6);
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v9 = *((id *)v5 + 13);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v79, v11, v86, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v80 != v16)
          objc_enumerationMutation(v9);
        objc_msgSend_addPeerPublishedStreams_(self, v13, *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i), v14);
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v13, (uint64_t)&v79, v14, v86, 16);
    }
    while (v15);
  }

  v21 = objc_msgSend_peerSubscribedStreamIdsCount(v5, v18, v19, v20);
  if (v21)
  {
    v24 = v21;
    for (j = 0; j != v24; ++j)
    {
      v26 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(v5, v22, j, v23);
      objc_msgSend_addPeerSubscribedStreamIds_(self, v27, v26, v28);
    }
  }
  v29 = *((_BYTE *)v5 + 144);
  if ((v29 & 4) != 0)
  {
    self->_linkId = *((_DWORD *)v5 + 21);
    *(_BYTE *)&self->_has |= 4u;
    v29 = *((_BYTE *)v5 + 144);
  }
  if ((v29 & 1) != 0)
  {
    self->_channelSettings = *((_DWORD *)v5 + 17);
    *(_BYTE *)&self->_has |= 1u;
  }
  v30 = *((_QWORD *)v5 + 15);
  if (v30)
    objc_msgSend_setReportingDataBlob_(self, v22, v30, v23);
  v31 = objc_msgSend_lightweightParticipantIdListsCount(v5, v22, v30, v23);
  if (v31)
  {
    v34 = v31;
    for (k = 0; k != v34; ++k)
    {
      v36 = objc_msgSend_lightweightParticipantIdListAtIndex_(v5, v32, k, v33);
      objc_msgSend_addLightweightParticipantIdList_(self, v37, v36, v38);
    }
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v39 = *((id *)v5 + 14);
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v75, v41, v85, 16);
  if (v42)
  {
    v45 = v42;
    v46 = *(_QWORD *)v76;
    do
    {
      for (m = 0; m != v45; ++m)
      {
        if (*(_QWORD *)v76 != v46)
          objc_enumerationMutation(v39);
        objc_msgSend_addQuicConnectionInfo_(self, v43, *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * m), v44);
      }
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v43, (uint64_t)&v75, v44, v85, 16);
    }
    while (v45);
  }

  if ((*((_BYTE *)v5 + 144) & 8) != 0)
  {
    self->_participantType = *((_DWORD *)v5 + 24);
    *(_BYTE *)&self->_has |= 8u;
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v48 = *((id *)v5 + 11);
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v71, v50, v84, 16);
  if (v51)
  {
    v54 = v51;
    v55 = *(_QWORD *)v72;
    do
    {
      for (n = 0; n != v54; ++n)
      {
        if (*(_QWORD *)v72 != v55)
          objc_enumerationMutation(v48);
        objc_msgSend_addMaterials_(self, v52, *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * n), v53);
      }
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v52, (uint64_t)&v71, v53, v84, 16);
    }
    while (v54);
  }

  v57 = *((_BYTE *)v5 + 144);
  if ((v57 & 2) != 0)
  {
    self->_generationCounter = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 2u;
    v57 = *((_BYTE *)v5 + 144);
  }
  if ((v57 & 0x10) != 0)
  {
    self->_sessionStateCounter = *((_DWORD *)v5 + 32);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v58 = *((id *)v5 + 7);
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v67, v60, v83, 16);
  if (v61)
  {
    v64 = v61;
    v65 = *(_QWORD *)v68;
    do
    {
      for (ii = 0; ii != v64; ++ii)
      {
        if (*(_QWORD *)v68 != v65)
          objc_enumerationMutation(v58);
        objc_msgSend_addActiveExperiments_(self, v62, *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * ii), v63, (_QWORD)v67);
      }
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v62, (uint64_t)&v67, v63, v83, 16);
    }
    while (v64);
  }

}

- (NSString)clientAddress
{
  return self->_clientAddress;
}

- (void)setClientAddress:(id)a3
{
  objc_storeStrong((id *)&self->_clientAddress, a3);
}

- (unsigned)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(unsigned int)a3
{
  self->_channelId = a3;
}

- (NSString)software
{
  return self->_software;
}

- (void)setSoftware:(id)a3
{
  objc_storeStrong((id *)&self->_software, a3);
}

- (NSMutableArray)peerPublishedStreams
{
  return self->_peerPublishedStreams;
}

- (void)setPeerPublishedStreams:(id)a3
{
  objc_storeStrong((id *)&self->_peerPublishedStreams, a3);
}

- (unsigned)linkId
{
  return self->_linkId;
}

- (unsigned)channelSettings
{
  return self->_channelSettings;
}

- (NSData)reportingDataBlob
{
  return self->_reportingDataBlob;
}

- (void)setReportingDataBlob:(id)a3
{
  objc_storeStrong((id *)&self->_reportingDataBlob, a3);
}

- (NSMutableArray)quicConnectionInfos
{
  return self->_quicConnectionInfos;
}

- (void)setQuicConnectionInfos:(id)a3
{
  objc_storeStrong((id *)&self->_quicConnectionInfos, a3);
}

- (unsigned)participantType
{
  return self->_participantType;
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (unsigned)sessionStateCounter
{
  return self->_sessionStateCounter;
}

- (NSMutableArray)materials
{
  return self->_materials;
}

- (void)setMaterials:(id)a3
{
  objc_storeStrong((id *)&self->_materials, a3);
}

- (NSMutableArray)activeExperiments
{
  return self->_activeExperiments;
}

- (void)setActiveExperiments:(id)a3
{
  objc_storeStrong((id *)&self->_activeExperiments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_software, 0);
  objc_storeStrong((id *)&self->_reportingDataBlob, 0);
  objc_storeStrong((id *)&self->_quicConnectionInfos, 0);
  objc_storeStrong((id *)&self->_peerPublishedStreams, 0);
  objc_storeStrong((id *)&self->_materials, 0);
  objc_storeStrong((id *)&self->_clientAddress, 0);
  objc_storeStrong((id *)&self->_activeExperiments, 0);
}

@end
