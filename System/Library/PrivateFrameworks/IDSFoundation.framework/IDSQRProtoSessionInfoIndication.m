@implementation IDSQRProtoSessionInfoIndication

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoSessionInfoIndication;
  -[IDSQRProtoSessionInfoIndication dealloc](&v3, sel_dealloc);
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

- (void)clearJoinedParticipants
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_joinedParticipants, a2, v2, v3);
}

- (void)addJoinedParticipants:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *joinedParticipants;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  joinedParticipants = self->_joinedParticipants;
  v9 = (char *)v4;
  if (!joinedParticipants)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_joinedParticipants;
    self->_joinedParticipants = v7;

    v4 = v9;
    joinedParticipants = self->_joinedParticipants;
  }
  objc_msgSend_addObject_(joinedParticipants, v4, (uint64_t)v4, v5);

}

- (unint64_t)joinedParticipantsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_joinedParticipants, a2, v2, v3);
}

- (id)joinedParticipantsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_joinedParticipants, a2, a3, v3);
}

+ (Class)joinedParticipantsType
{
  return (Class)objc_opt_class();
}

- (void)clearLeftParticipants
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_leftParticipants, a2, v2, v3);
}

- (void)addLeftParticipants:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *leftParticipants;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  leftParticipants = self->_leftParticipants;
  v9 = (char *)v4;
  if (!leftParticipants)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_leftParticipants;
    self->_leftParticipants = v7;

    v4 = v9;
    leftParticipants = self->_leftParticipants;
  }
  objc_msgSend_addObject_(leftParticipants, v4, (uint64_t)v4, v5);

}

- (unint64_t)leftParticipantsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_leftParticipants, a2, v2, v3);
}

- (id)leftParticipantsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_leftParticipants, a2, a3, v3);
}

+ (Class)leftParticipantsType
{
  return (Class)objc_opt_class();
}

- (void)clearUpdatedParticipants
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_updatedParticipants, a2, v2, v3);
}

- (void)addUpdatedParticipants:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *updatedParticipants;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  updatedParticipants = self->_updatedParticipants;
  v9 = (char *)v4;
  if (!updatedParticipants)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_updatedParticipants;
    self->_updatedParticipants = v7;

    v4 = v9;
    updatedParticipants = self->_updatedParticipants;
  }
  objc_msgSend_addObject_(updatedParticipants, v4, (uint64_t)v4, v5);

}

- (unint64_t)updatedParticipantsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_updatedParticipants, a2, v2, v3);
}

- (id)updatedParticipantsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_updatedParticipants, a2, a3, v3);
}

+ (Class)updatedParticipantsType
{
  return (Class)objc_opt_class();
}

- (void)setTxnId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_txnId = a3;
}

- (void)setHasTxnId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxnId
{
  return *(_BYTE *)&self->_has & 1;
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
  v13.super_class = (Class)IDSQRProtoSessionInfoIndication;
  -[IDSQRProtoSessionInfoIndication description](&v13, sel_description);
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
  uint64_t v7;
  double v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  NSMutableArray *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  double v43;
  id v44;
  const char *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  const char *v49;
  double v50;
  void *v51;
  NSMutableArray *v52;
  const char *v53;
  double v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  const char *v67;
  uint64_t v68;
  double v69;
  id v70;
  const char *v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  const char *v75;
  double v76;
  void *v77;
  NSMutableArray *v78;
  const char *v79;
  double v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t k;
  void *v88;
  const char *v89;
  double v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  id v95;
  const char *v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  const char *v100;
  double v101;
  void *v102;
  NSMutableArray *v103;
  const char *v104;
  double v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  double v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t m;
  void *v113;
  const char *v114;
  double v115;
  const char *v116;
  double v117;
  char has;
  void *v119;
  const char *v120;
  double v121;
  void *v122;
  const char *v123;
  double v124;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_peerPublishedStreams, v6, v7, v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v13 = objc_msgSend_count(self->_peerPublishedStreams, v10, v11, v12);
    v16 = (void *)objc_msgSend_initWithCapacity_(v9, v14, v13, v15);
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v17 = self->_peerPublishedStreams;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v138, v19, v145, 16);
    if (v20)
    {
      v24 = v20;
      v25 = *(_QWORD *)v139;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v139 != v25)
            objc_enumerationMutation(v17);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v138 + 1) + 8 * i), v21, v22, v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v16, v28, (uint64_t)v27, v29);

        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v138, v23, v145, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v5, v30, (uint64_t)v16, v31, CFSTR("peer_published_streams"));
  }
  PBRepeatedUInt32NSArray();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v33, (uint64_t)v32, v34, CFSTR("peer_subscribed_stream_ids"));

  PBRepeatedUInt64NSArray();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v35, v37, CFSTR("lightweight_participant_id_list"));

  if (objc_msgSend_count(self->_joinedParticipants, v38, v39, v40))
  {
    v44 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v48 = objc_msgSend_count(self->_joinedParticipants, v45, v46, v47);
    v51 = (void *)objc_msgSend_initWithCapacity_(v44, v49, v48, v50);
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v52 = self->_joinedParticipants;
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v134, v54, v144, 16);
    if (v55)
    {
      v59 = v55;
      v60 = *(_QWORD *)v135;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v135 != v60)
            objc_enumerationMutation(v52);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v134 + 1) + 8 * j), v56, v57, v58);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v51, v63, (uint64_t)v62, v64);

        }
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v56, (uint64_t)&v134, v58, v144, 16);
      }
      while (v59);
    }

    objc_msgSend_setObject_forKey_(v5, v65, (uint64_t)v51, v66, CFSTR("joined_participants"));
  }
  if (objc_msgSend_count(self->_leftParticipants, v41, v42, v43))
  {
    v70 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v74 = objc_msgSend_count(self->_leftParticipants, v71, v72, v73);
    v77 = (void *)objc_msgSend_initWithCapacity_(v70, v75, v74, v76);
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v78 = self->_leftParticipants;
    v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v130, v80, v143, 16);
    if (v81)
    {
      v85 = v81;
      v86 = *(_QWORD *)v131;
      do
      {
        for (k = 0; k != v85; ++k)
        {
          if (*(_QWORD *)v131 != v86)
            objc_enumerationMutation(v78);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v130 + 1) + 8 * k), v82, v83, v84);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v77, v89, (uint64_t)v88, v90);

        }
        v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v82, (uint64_t)&v130, v84, v143, 16);
      }
      while (v85);
    }

    objc_msgSend_setObject_forKey_(v5, v91, (uint64_t)v77, v92, CFSTR("left_participants"));
  }
  if (objc_msgSend_count(self->_updatedParticipants, v67, v68, v69))
  {
    v95 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v99 = objc_msgSend_count(self->_updatedParticipants, v96, v97, v98);
    v102 = (void *)objc_msgSend_initWithCapacity_(v95, v100, v99, v101);
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v103 = self->_updatedParticipants;
    v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v126, v105, v142, 16);
    if (v106)
    {
      v110 = v106;
      v111 = *(_QWORD *)v127;
      do
      {
        for (m = 0; m != v110; ++m)
        {
          if (*(_QWORD *)v127 != v111)
            objc_enumerationMutation(v103);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v126 + 1) + 8 * m), v107, v108, v109, (_QWORD)v126);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v102, v114, (uint64_t)v113, v115);

        }
        v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v107, (uint64_t)&v126, v109, v142, 16);
      }
      while (v110);
    }

    objc_msgSend_setObject_forKey_(v5, v116, (uint64_t)v102, v117, CFSTR("updated_participants"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v93, self->_txnId, v94);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v120, (uint64_t)v119, v121, CFSTR("txn_id"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v93, self->_generationCounter, v94);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v123, (uint64_t)v122, v124, CFSTR("generation_counter"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionInfoIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
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
  char has;
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
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v5 = self->_peerPublishedStreams;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v56, v7, v63, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v57 != v10)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v56, v13, v63, 16);
    }
    while (v9);
  }

  if (self->_peerSubscribedStreamIds.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v14;
    }
    while (v14 < self->_peerSubscribedStreamIds.count);
  }
  if (self->_lightweightParticipantIdLists.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v15;
    }
    while (v15 < self->_lightweightParticipantIdLists.count);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v16 = self->_joinedParticipants;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v52, v18, v62, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v23, (uint64_t)&v52, v24, v62, 16);
    }
    while (v20);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v25 = self->_leftParticipants;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v48, v27, v61, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v32, (uint64_t)&v48, v33, v61, 16);
    }
    while (v29);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v34 = self->_updatedParticipants;
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v44, v36, v60, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(v34);
        PBDataWriterWriteSubmessage();
      }
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v41, (uint64_t)&v44, v42, v60, 16);
    }
    while (v38);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  const char *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  const char *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  const char *v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t n;
  void *v64;
  const char *v65;
  double v66;
  const char *v67;
  uint64_t v68;
  double v69;
  const char *v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  const char *v74;
  double v75;
  uint64_t v76;
  uint64_t ii;
  void *v78;
  const char *v79;
  double v80;
  char has;
  id v82;

  v82 = a3;
  if (objc_msgSend_peerPublishedStreamsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearPeerPublishedStreams(v82, v7, v8, v9);
    v13 = objc_msgSend_peerPublishedStreamsCount(self, v10, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_peerPublishedStreamsAtIndex_(self, v7, i, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPeerPublishedStreams_(v82, v17, (uint64_t)v16, v18);

      }
    }
  }
  if (objc_msgSend_peerSubscribedStreamIdsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearPeerSubscribedStreamIds(v82, v19, v20, v21);
    v25 = objc_msgSend_peerSubscribedStreamIdsCount(self, v22, v23, v24);
    if (v25)
    {
      v26 = v25;
      for (j = 0; j != v26; ++j)
      {
        v28 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(self, v19, j, v21);
        objc_msgSend_addPeerSubscribedStreamIds_(v82, v29, v28, v30);
      }
    }
  }
  if (objc_msgSend_lightweightParticipantIdListsCount(self, v19, v20, v21))
  {
    objc_msgSend_clearLightweightParticipantIdLists(v82, v31, v32, v33);
    v37 = objc_msgSend_lightweightParticipantIdListsCount(self, v34, v35, v36);
    if (v37)
    {
      v38 = v37;
      for (k = 0; k != v38; ++k)
      {
        v40 = objc_msgSend_lightweightParticipantIdListAtIndex_(self, v31, k, v33);
        objc_msgSend_addLightweightParticipantIdList_(v82, v41, v40, v42);
      }
    }
  }
  if (objc_msgSend_joinedParticipantsCount(self, v31, v32, v33))
  {
    objc_msgSend_clearJoinedParticipants(v82, v43, v44, v45);
    v49 = objc_msgSend_joinedParticipantsCount(self, v46, v47, v48);
    if (v49)
    {
      v50 = v49;
      for (m = 0; m != v50; ++m)
      {
        objc_msgSend_joinedParticipantsAtIndex_(self, v43, m, v45);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addJoinedParticipants_(v82, v53, (uint64_t)v52, v54);

      }
    }
  }
  if (objc_msgSend_leftParticipantsCount(self, v43, v44, v45))
  {
    objc_msgSend_clearLeftParticipants(v82, v55, v56, v57);
    v61 = objc_msgSend_leftParticipantsCount(self, v58, v59, v60);
    if (v61)
    {
      v62 = v61;
      for (n = 0; n != v62; ++n)
      {
        objc_msgSend_leftParticipantsAtIndex_(self, v55, n, v57);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addLeftParticipants_(v82, v65, (uint64_t)v64, v66);

      }
    }
  }
  if (objc_msgSend_updatedParticipantsCount(self, v55, v56, v57))
  {
    objc_msgSend_clearUpdatedParticipants(v82, v67, v68, v69);
    v73 = objc_msgSend_updatedParticipantsCount(self, v70, v71, v72);
    if (v73)
    {
      v76 = v73;
      for (ii = 0; ii != v76; ++ii)
      {
        objc_msgSend_updatedParticipantsAtIndex_(self, v74, ii, v75);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addUpdatedParticipants_(v82, v79, (uint64_t)v78, v80);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v82 + 7) = self->_txnId;
    *((_BYTE *)v82 + 104) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v82 + 16) = self->_generationCounter;
    *((_BYTE *)v82 + 104) |= 2u;
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
  NSMutableArray *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  double v24;
  NSMutableArray *v25;
  const char *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  const char *v35;
  double v36;
  NSMutableArray *v37;
  const char *v38;
  double v39;
  uint64_t v40;
  const char *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  const char *v47;
  double v48;
  NSMutableArray *v49;
  const char *v50;
  double v51;
  uint64_t v52;
  const char *v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  const char *v59;
  double v60;
  char has;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v13 = self->_peerPublishedStreams;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v75, v15, v82, 16);
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v76 != v20)
          objc_enumerationMutation(v13);
        v22 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v75 + 1) + 8 * i), v17, (uint64_t)a3, v18);
        objc_msgSend_addPeerPublishedStreams_((void *)v12, v23, (uint64_t)v22, v24);

      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v75, v18, v82, 16);
    }
    while (v19);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v25 = self->_joinedParticipants;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v71, v27, v81, 16);
  if (v28)
  {
    v31 = v28;
    v32 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v72 != v32)
          objc_enumerationMutation(v25);
        v34 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v71 + 1) + 8 * j), v29, (uint64_t)a3, v30);
        objc_msgSend_addJoinedParticipants_((void *)v12, v35, (uint64_t)v34, v36);

      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v29, (uint64_t)&v71, v30, v81, 16);
    }
    while (v31);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v37 = self->_leftParticipants;
  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v67, v39, v80, 16);
  if (v40)
  {
    v43 = v40;
    v44 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v68 != v44)
          objc_enumerationMutation(v37);
        v46 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v67 + 1) + 8 * k), v41, (uint64_t)a3, v42);
        objc_msgSend_addLeftParticipants_((void *)v12, v47, (uint64_t)v46, v48);

      }
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v41, (uint64_t)&v67, v42, v80, 16);
    }
    while (v43);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v49 = self->_updatedParticipants;
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v63, v51, v79, 16);
  if (v52)
  {
    v55 = v52;
    v56 = *(_QWORD *)v64;
    do
    {
      for (m = 0; m != v55; ++m)
      {
        if (*(_QWORD *)v64 != v56)
          objc_enumerationMutation(v49);
        v58 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v63 + 1) + 8 * m), v53, (uint64_t)a3, v54, (_QWORD)v63);
        objc_msgSend_addUpdatedParticipants_((void *)v12, v59, (uint64_t)v58, v60);

      }
      v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v53, (uint64_t)&v63, v54, v79, 16);
    }
    while (v55);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v12 + 56) = self->_txnId;
    *(_BYTE *)(v12 + 104) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 64) = self->_generationCounter;
    *(_BYTE *)(v12 + 104) |= 2u;
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
  NSMutableArray *peerPublishedStreams;
  uint64_t v11;
  const char *v12;
  double v13;
  NSMutableArray *joinedParticipants;
  uint64_t v15;
  NSMutableArray *leftParticipants;
  uint64_t v17;
  NSMutableArray *updatedParticipants;
  uint64_t v19;
  BOOL v20;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_21;
  peerPublishedStreams = self->_peerPublishedStreams;
  v11 = v4[11];
  if ((unint64_t)peerPublishedStreams | v11)
  {
    if (!objc_msgSend_isEqual_(peerPublishedStreams, v8, v11, v9))
      goto LABEL_21;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_21;
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_21;
  joinedParticipants = self->_joinedParticipants;
  v15 = v4[9];
  if ((unint64_t)joinedParticipants | v15)
  {
    if (!objc_msgSend_isEqual_(joinedParticipants, v12, v15, v13))
      goto LABEL_21;
  }
  leftParticipants = self->_leftParticipants;
  v17 = v4[10];
  if ((unint64_t)leftParticipants | v17)
  {
    if (!objc_msgSend_isEqual_(leftParticipants, v12, v17, v13))
      goto LABEL_21;
  }
  updatedParticipants = self->_updatedParticipants;
  v19 = v4[12];
  if ((unint64_t)updatedParticipants | v19)
  {
    if (!objc_msgSend_isEqual_(updatedParticipants, v12, v19, v13))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[13] & 1) == 0 || self->_txnId != v4[7])
      goto LABEL_21;
  }
  else if ((v4[13] & 1) != 0)
  {
LABEL_21:
    v20 = 0;
    goto LABEL_22;
  }
  v20 = (v4[13] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[13] & 2) == 0 || self->_generationCounter != *((_DWORD *)v4 + 16))
      goto LABEL_21;
    v20 = 1;
  }
LABEL_22:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v5 = objc_msgSend_hash(self->_peerPublishedStreams, a2, v2, v3);
  v6 = PBRepeatedUInt32Hash();
  v7 = PBRepeatedUInt64Hash();
  v11 = objc_msgSend_hash(self->_joinedParticipants, v8, v9, v10);
  v15 = objc_msgSend_hash(self->_leftParticipants, v12, v13, v14);
  v19 = objc_msgSend_hash(self->_updatedParticipants, v16, v17, v18);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v20 = 2654435761u * self->_txnId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    return v6 ^ v5 ^ v7 ^ v11 ^ v15 ^ v19 ^ v20 ^ v21;
  }
  v20 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v21 = 2654435761 * self->_generationCounter;
  return v6 ^ v5 ^ v7 ^ v11 ^ v15 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  const char *v24;
  double v25;
  uint64_t v26;
  const char *v27;
  double v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  const char *v32;
  double v33;
  id v34;
  const char *v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  id v43;
  const char *v44;
  double v45;
  uint64_t v46;
  const char *v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  id v52;
  const char *v53;
  double v54;
  uint64_t v55;
  const char *v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t ii;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v5 = *((id *)v4 + 11);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v74, v7, v81, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v75 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend_addPeerPublishedStreams_(self, v9, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i), v10);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v74, v10, v81, 16);
    }
    while (v11);
  }

  v17 = objc_msgSend_peerSubscribedStreamIdsCount(v4, v14, v15, v16);
  if (v17)
  {
    v21 = v17;
    for (j = 0; j != v21; ++j)
    {
      v23 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(v4, v18, j, v20);
      objc_msgSend_addPeerSubscribedStreamIds_(self, v24, v23, v25);
    }
  }
  v26 = objc_msgSend_lightweightParticipantIdListsCount(v4, v18, v19, v20);
  if (v26)
  {
    v29 = v26;
    for (k = 0; k != v29; ++k)
    {
      v31 = objc_msgSend_lightweightParticipantIdListAtIndex_(v4, v27, k, v28);
      objc_msgSend_addLightweightParticipantIdList_(self, v32, v31, v33);
    }
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v34 = *((id *)v4 + 9);
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v70, v36, v80, 16);
  if (v37)
  {
    v40 = v37;
    v41 = *(_QWORD *)v71;
    do
    {
      for (m = 0; m != v40; ++m)
      {
        if (*(_QWORD *)v71 != v41)
          objc_enumerationMutation(v34);
        objc_msgSend_addJoinedParticipants_(self, v38, *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * m), v39);
      }
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v38, (uint64_t)&v70, v39, v80, 16);
    }
    while (v40);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v43 = *((id *)v4 + 10);
  v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v66, v45, v79, 16);
  if (v46)
  {
    v49 = v46;
    v50 = *(_QWORD *)v67;
    do
    {
      for (n = 0; n != v49; ++n)
      {
        if (*(_QWORD *)v67 != v50)
          objc_enumerationMutation(v43);
        objc_msgSend_addLeftParticipants_(self, v47, *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * n), v48);
      }
      v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v47, (uint64_t)&v66, v48, v79, 16);
    }
    while (v49);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v52 = *((id *)v4 + 12);
  v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v62, v54, v78, 16);
  if (v55)
  {
    v58 = v55;
    v59 = *(_QWORD *)v63;
    do
    {
      for (ii = 0; ii != v58; ++ii)
      {
        if (*(_QWORD *)v63 != v59)
          objc_enumerationMutation(v52);
        objc_msgSend_addUpdatedParticipants_(self, v56, *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * ii), v57, (_QWORD)v62);
      }
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v56, (uint64_t)&v62, v57, v78, 16);
    }
    while (v58);
  }

  v61 = *((_BYTE *)v4 + 104);
  if ((v61 & 1) != 0)
  {
    self->_txnId = *((_QWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
    v61 = *((_BYTE *)v4 + 104);
  }
  if ((v61 & 2) != 0)
  {
    self->_generationCounter = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSMutableArray)peerPublishedStreams
{
  return self->_peerPublishedStreams;
}

- (void)setPeerPublishedStreams:(id)a3
{
  objc_storeStrong((id *)&self->_peerPublishedStreams, a3);
}

- (NSMutableArray)joinedParticipants
{
  return self->_joinedParticipants;
}

- (void)setJoinedParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_joinedParticipants, a3);
}

- (NSMutableArray)leftParticipants
{
  return self->_leftParticipants;
}

- (void)setLeftParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_leftParticipants, a3);
}

- (NSMutableArray)updatedParticipants
{
  return self->_updatedParticipants;
}

- (void)setUpdatedParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_updatedParticipants, a3);
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedParticipants, 0);
  objc_storeStrong((id *)&self->_peerPublishedStreams, 0);
  objc_storeStrong((id *)&self->_leftParticipants, 0);
  objc_storeStrong((id *)&self->_joinedParticipants, 0);
}

@end
