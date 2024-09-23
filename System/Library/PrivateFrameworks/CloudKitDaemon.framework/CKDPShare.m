@implementation CKDPShare

- (id)_publicAccessCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_publicAccess(self, a2, v2);
  if ((v3 - 1) < 4)
    return off_1E7834420[(int)v3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (int)publicAccess
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_publicAccess;
  else
    return 1;
}

- (void)setPublicAccess:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_publicAccess = a3;
}

- (void)setHasPublicAccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPublicAccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)publicAccessAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E7835CC0[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPublicAccess:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("none")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("readOnly")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("readWrite")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("derived")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasInvitedPcs
{
  return self->_invitedPcs != 0;
}

- (BOOL)hasSelfAddedPcs
{
  return self->_selfAddedPcs != 0;
}

- (void)clearParticipants
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_participants, a2, v2);
}

- (void)addParticipant:(id)a3
{
  const char *v4;
  NSMutableArray *participants;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  participants = self->_participants;
  v8 = (char *)v4;
  if (!participants)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_participants;
    self->_participants = v6;

    v4 = v8;
    participants = self->_participants;
  }
  objc_msgSend_addObject_(participants, v4, (uint64_t)v4);

}

- (unint64_t)participantsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_participants, a2, v2);
}

- (id)participantAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_participants, a2, a3);
}

+ (Class)participantType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasShortTokenRoutingKey
{
  return self->_shortTokenRoutingKey != 0;
}

- (void)clearPotentialMatchs
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_potentialMatchs, a2, v2);
}

- (void)addPotentialMatch:(id)a3
{
  const char *v4;
  NSMutableArray *potentialMatchs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  potentialMatchs = self->_potentialMatchs;
  v8 = (char *)v4;
  if (!potentialMatchs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_potentialMatchs;
    self->_potentialMatchs = v6;

    v4 = v8;
    potentialMatchs = self->_potentialMatchs;
  }
  objc_msgSend_addObject_(potentialMatchs, v4, (uint64_t)v4);

}

- (unint64_t)potentialMatchsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_potentialMatchs, a2, v2);
}

- (id)potentialMatchAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_potentialMatchs, a2, a3);
}

+ (Class)potentialMatchType
{
  return (Class)objc_opt_class();
}

- (void)clearInvitedKeyToRemoves
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_invitedKeyToRemoves, a2, v2);
}

- (void)addInvitedKeyToRemove:(id)a3
{
  const char *v4;
  NSMutableArray *invitedKeyToRemoves;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  invitedKeyToRemoves = self->_invitedKeyToRemoves;
  v8 = (char *)v4;
  if (!invitedKeyToRemoves)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_invitedKeyToRemoves;
    self->_invitedKeyToRemoves = v6;

    v4 = v8;
    invitedKeyToRemoves = self->_invitedKeyToRemoves;
  }
  objc_msgSend_addObject_(invitedKeyToRemoves, v4, (uint64_t)v4);

}

- (unint64_t)invitedKeyToRemovesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_invitedKeyToRemoves, a2, v2);
}

- (id)invitedKeyToRemoveAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_invitedKeyToRemoves, a2, a3);
}

+ (Class)invitedKeyToRemoveType
{
  return (Class)objc_opt_class();
}

- (BOOL)publisherModel
{
  return (*(_BYTE *)&self->_has & 0x20) != 0 && self->_publisherModel;
}

- (void)setPublisherModel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_publisherModel = a3;
}

- (void)setHasPublisherModel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPublisherModel
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)anonymousPublicAccess
{
  return (*(_BYTE *)&self->_has & 8) != 0 && self->_anonymousPublicAccess;
}

- (void)setAnonymousPublicAccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_anonymousPublicAccess = a3;
}

- (void)setHasAnonymousPublicAccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAnonymousPublicAccess
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasDisplayedHostname
{
  return self->_displayedHostname != 0;
}

- (int)publisherModelType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_publisherModelType;
  else
    return 1;
}

- (void)setPublisherModelType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_publisherModelType = a3;
}

- (void)setHasPublisherModelType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPublisherModelType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)publisherModelTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E7835CE0[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPublisherModelType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("participantsSeeAccepted")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("readOnlyCannotSeeReadOnly")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("selfAndOwner")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("anonymousPublic")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int)participantSelfRemovalBehavior
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_participantSelfRemovalBehavior;
  else
    return 1;
}

- (void)setParticipantSelfRemovalBehavior:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_participantSelfRemovalBehavior = a3;
}

- (void)setHasParticipantSelfRemovalBehavior:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantSelfRemovalBehavior
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)participantSelfRemovalBehaviorAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7835D00[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParticipantSelfRemovalBehavior:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("setInvited")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("setUnsubscribed")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("removeFromShare")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)denyAccessRequests
{
  return (*(_BYTE *)&self->_has & 0x10) != 0 && self->_denyAccessRequests;
}

- (void)setDenyAccessRequests:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_denyAccessRequests = a3;
}

- (void)setHasDenyAccessRequests:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDenyAccessRequests
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasRequestingAccess
{
  return self->_requestingAccess != 0;
}

- (BOOL)hasBlockedRequestingAccess
{
  return self->_blockedRequestingAccess != 0;
}

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPShare;
  -[CKDPShare description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPShareIdentifier *shareId;
  void *v8;
  const char *v9;
  NSString *etag;
  unsigned int v11;
  __CFString *v12;
  CKDPProtectionInfo *invitedPcs;
  void *v14;
  const char *v15;
  CKDPProtectionInfo *selfAddedPcs;
  void *v17;
  const char *v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  NSMutableArray *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  const char *v35;
  const char *v36;
  NSString *shortTokenRoutingKey;
  const char *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  NSMutableArray *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  const char *v54;
  const char *v55;
  NSMutableArray *invitedKeyToRemoves;
  char has;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  NSString *displayedHostname;
  char v63;
  void *v64;
  const char *v65;
  CKDPShareAccessRequesters *requestingAccess;
  void *v67;
  const char *v68;
  CKDPShareAccessBlockedRequesters *blockedRequestingAccess;
  void *v70;
  const char *v71;
  NSData *shortTokenHash;
  NSString *origin;
  unsigned int v75;
  __CFString *v76;
  unsigned int v77;
  __CFString *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  shareId = self->_shareId;
  if (shareId)
  {
    objc_msgSend_dictionaryRepresentation(shareId, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("shareId"));

  }
  etag = self->_etag;
  if (etag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, CFSTR("etag"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = self->_publicAccess - 1;
    if (v11 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_publicAccess);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E7835CC0[v11];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v12, CFSTR("publicAccess"));

  }
  invitedPcs = self->_invitedPcs;
  if (invitedPcs)
  {
    objc_msgSend_dictionaryRepresentation(invitedPcs, v4, (uint64_t)etag);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("invitedPcs"));

  }
  selfAddedPcs = self->_selfAddedPcs;
  if (selfAddedPcs)
  {
    objc_msgSend_dictionaryRepresentation(selfAddedPcs, v4, (uint64_t)etag);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("selfAddedPcs"));

  }
  if (objc_msgSend_count(self->_participants, v4, (uint64_t)etag))
  {
    v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v23 = objc_msgSend_count(self->_participants, v21, v22);
    v25 = (void *)objc_msgSend_initWithCapacity_(v20, v24, v23);
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v26 = self->_participants;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v83, v88, 16);
    if (v28)
    {
      v31 = v28;
      v32 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v84 != v32)
            objc_enumerationMutation(v26);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v83 + 1) + 8 * i), v29, v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v25, v35, (uint64_t)v34);

        }
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v83, v88, 16);
      }
      while (v31);
    }

    objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v25, CFSTR("participant"));
  }
  shortTokenRoutingKey = self->_shortTokenRoutingKey;
  if (shortTokenRoutingKey)
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)shortTokenRoutingKey, CFSTR("shortTokenRoutingKey"));
  if (objc_msgSend_count(self->_potentialMatchs, v19, (uint64_t)shortTokenRoutingKey))
  {
    v39 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v42 = objc_msgSend_count(self->_potentialMatchs, v40, v41);
    v44 = (void *)objc_msgSend_initWithCapacity_(v39, v43, v42);
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v45 = self->_potentialMatchs;
    v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v79, v87, 16);
    if (v47)
    {
      v50 = v47;
      v51 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v80 != v51)
            objc_enumerationMutation(v45);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v79 + 1) + 8 * j), v48, v49);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v44, v54, (uint64_t)v53);

        }
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v79, v87, 16);
      }
      while (v50);
    }

    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)v44, CFSTR("potentialMatch"));
  }
  invitedKeyToRemoves = self->_invitedKeyToRemoves;
  if (invitedKeyToRemoves)
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)invitedKeyToRemoves, CFSTR("invitedKeyToRemove"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v38, self->_publisherModel);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v59, (uint64_t)v58, CFSTR("publisherModel"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v38, self->_anonymousPublicAccess);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v61, (uint64_t)v60, CFSTR("anonymousPublicAccess"));

  }
  displayedHostname = self->_displayedHostname;
  if (displayedHostname)
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)displayedHostname, CFSTR("displayedHostname"));
  v63 = (char)self->_has;
  if ((v63 & 4) != 0)
  {
    v75 = self->_publisherModelType - 1;
    if (v75 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v38, (uint64_t)CFSTR("(unknown: %i)"), self->_publisherModelType);
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_1E7835CE0[v75];
    }
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v76, CFSTR("publisherModelType"));

    v63 = (char)self->_has;
    if ((v63 & 1) == 0)
    {
LABEL_44:
      if ((v63 & 0x10) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_44;
  }
  v77 = self->_participantSelfRemovalBehavior - 1;
  if (v77 >= 3)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v38, (uint64_t)CFSTR("(unknown: %i)"), self->_participantSelfRemovalBehavior);
    v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = off_1E7835D00[v77];
  }
  objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v78, CFSTR("participantSelfRemovalBehavior"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_45:
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v38, self->_denyAccessRequests);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v65, (uint64_t)v64, CFSTR("denyAccessRequests"));

  }
LABEL_46:
  requestingAccess = self->_requestingAccess;
  if (requestingAccess)
  {
    objc_msgSend_dictionaryRepresentation(requestingAccess, v38, (uint64_t)displayedHostname);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v68, (uint64_t)v67, CFSTR("requestingAccess"));

  }
  blockedRequestingAccess = self->_blockedRequestingAccess;
  if (blockedRequestingAccess)
  {
    objc_msgSend_dictionaryRepresentation(blockedRequestingAccess, v38, (uint64_t)displayedHostname);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v71, (uint64_t)v70, CFSTR("blockedRequestingAccess"));

  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)shortTokenHash, CFSTR("shortTokenHash"));
  origin = self->_origin;
  if (origin)
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)origin, CFSTR("origin"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPShareReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  const char *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  const char *v25;
  char has;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_shareId)
    PBDataWriterWriteSubmessage();
  if (self->_etag)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_invitedPcs)
    PBDataWriterWriteSubmessage();
  if (self->_selfAddedPcs)
    PBDataWriterWriteSubmessage();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = self->_participants;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v36, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v36, v42, 16);
    }
    while (v8);
  }

  if (self->_shortTokenRoutingKey)
    PBDataWriterWriteStringField();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = self->_potentialMatchs;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v32, v41, 16);
    }
    while (v15);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = self->_invitedKeyToRemoves;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v28, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v19);
        PBDataWriterWriteDataField();
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v28, v40, 16);
    }
    while (v22);
  }

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_displayedHostname)
    PBDataWriterWriteStringField();
  v27 = (char)self->_has;
  if ((v27 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v27 = (char)self->_has;
    if ((v27 & 1) == 0)
    {
LABEL_42:
      if ((v27 & 0x10) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_42;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_43:
    PBDataWriterWriteBOOLField();
LABEL_44:
  if (self->_requestingAccess)
    PBDataWriterWriteSubmessage();
  if (self->_blockedRequestingAccess)
    PBDataWriterWriteSubmessage();
  if (self->_shortTokenHash)
    PBDataWriterWriteDataField();
  if (self->_origin)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPShareIdentifier *shareId;
  NSString *etag;
  CKDPProtectionInfo *invitedPcs;
  CKDPProtectionInfo *selfAddedPcs;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  NSString *shortTokenRoutingKey;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  const char *v37;
  char has;
  _BYTE *v39;
  NSString *displayedHostname;
  char v41;
  CKDPShareAccessRequesters *requestingAccess;
  CKDPShareAccessBlockedRequesters *blockedRequestingAccess;
  NSData *shortTokenHash;
  NSString *origin;
  _BYTE *v46;

  v4 = a3;
  shareId = self->_shareId;
  v46 = v4;
  if (shareId)
  {
    objc_msgSend_setShareId_(v4, v5, (uint64_t)shareId);
    v4 = v46;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v46, v5, (uint64_t)etag);
    v4 = v46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_publicAccess;
    v4[132] |= 2u;
  }
  invitedPcs = self->_invitedPcs;
  if (invitedPcs)
    objc_msgSend_setInvitedPcs_(v46, v5, (uint64_t)invitedPcs);
  selfAddedPcs = self->_selfAddedPcs;
  if (selfAddedPcs)
    objc_msgSend_setSelfAddedPcs_(v46, v5, (uint64_t)selfAddedPcs);
  if (objc_msgSend_participantsCount(self, v5, (uint64_t)selfAddedPcs))
  {
    objc_msgSend_clearParticipants(v46, v10, v11);
    v14 = objc_msgSend_participantsCount(self, v12, v13);
    if (v14)
    {
      v15 = v14;
      for (i = 0; i != v15; ++i)
      {
        objc_msgSend_participantAtIndex_(self, v10, i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addParticipant_(v46, v18, (uint64_t)v17);

      }
    }
  }
  shortTokenRoutingKey = self->_shortTokenRoutingKey;
  if (shortTokenRoutingKey)
    objc_msgSend_setShortTokenRoutingKey_(v46, v10, (uint64_t)shortTokenRoutingKey);
  if (objc_msgSend_potentialMatchsCount(self, v10, (uint64_t)shortTokenRoutingKey))
  {
    objc_msgSend_clearPotentialMatchs(v46, v20, v21);
    v24 = objc_msgSend_potentialMatchsCount(self, v22, v23);
    if (v24)
    {
      v25 = v24;
      for (j = 0; j != v25; ++j)
      {
        objc_msgSend_potentialMatchAtIndex_(self, v20, j);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPotentialMatch_(v46, v28, (uint64_t)v27);

      }
    }
  }
  if (objc_msgSend_invitedKeyToRemovesCount(self, v20, v21))
  {
    objc_msgSend_clearInvitedKeyToRemoves(v46, v29, v30);
    v33 = objc_msgSend_invitedKeyToRemovesCount(self, v31, v32);
    if (v33)
    {
      v34 = v33;
      for (k = 0; k != v34; ++k)
      {
        objc_msgSend_invitedKeyToRemoveAtIndex_(self, v29, k);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addInvitedKeyToRemove_(v46, v37, (uint64_t)v36);

      }
    }
  }
  has = (char)self->_has;
  v39 = v46;
  if ((has & 0x20) != 0)
  {
    v46[130] = self->_publisherModel;
    v46[132] |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v46[128] = self->_anonymousPublicAccess;
    v46[132] |= 8u;
  }
  displayedHostname = self->_displayedHostname;
  if (displayedHostname)
  {
    objc_msgSend_setDisplayedHostname_(v46, v29, (uint64_t)displayedHostname);
    v39 = v46;
  }
  v41 = (char)self->_has;
  if ((v41 & 4) != 0)
  {
    *((_DWORD *)v39 + 21) = self->_publisherModelType;
    v39[132] |= 4u;
    v41 = (char)self->_has;
    if ((v41 & 1) == 0)
    {
LABEL_33:
      if ((v41 & 0x10) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_33;
  }
  *((_DWORD *)v39 + 14) = self->_participantSelfRemovalBehavior;
  v39[132] |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_34:
    v39[129] = self->_denyAccessRequests;
    v39[132] |= 0x10u;
  }
LABEL_35:
  requestingAccess = self->_requestingAccess;
  if (requestingAccess)
  {
    objc_msgSend_setRequestingAccess_(v46, v29, (uint64_t)requestingAccess);
    v39 = v46;
  }
  blockedRequestingAccess = self->_blockedRequestingAccess;
  if (blockedRequestingAccess)
  {
    objc_msgSend_setBlockedRequestingAccess_(v46, v29, (uint64_t)blockedRequestingAccess);
    v39 = v46;
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
  {
    objc_msgSend_setShortTokenHash_(v46, v29, (uint64_t)shortTokenHash);
    v39 = v46;
  }
  origin = self->_origin;
  if (origin)
  {
    objc_msgSend_setOrigin_(v46, v29, (uint64_t)origin);
    v39 = v46;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  NSMutableArray *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  const char *v43;
  NSMutableArray *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  const char *v52;
  const char *v53;
  char has;
  uint64_t v55;
  void *v56;
  const char *v57;
  char v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
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
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_shareId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 104);
  *(_QWORD *)(v10 + 104) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v15;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v10 + 80) = self->_publicAccess;
    *(_BYTE *)(v10 + 132) |= 2u;
  }
  v18 = objc_msgSend_copyWithZone_(self->_invitedPcs, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_selfAddedPcs, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 96);
  *(_QWORD *)(v10 + 96) = v21;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v23 = self->_participants;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v79, v85, 16);
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v80 != v28)
          objc_enumerationMutation(v23);
        v30 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v79 + 1) + 8 * i), v26, (uint64_t)a3);
        objc_msgSend_addParticipant_((void *)v10, v31, (uint64_t)v30);

      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v79, v85, 16);
    }
    while (v27);
  }

  v33 = objc_msgSend_copyWithZone_(self->_shortTokenRoutingKey, v32, (uint64_t)a3);
  v34 = *(void **)(v10 + 120);
  *(_QWORD *)(v10 + 120) = v33;

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v35 = self->_potentialMatchs;
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v75, v84, 16);
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v76 != v40)
          objc_enumerationMutation(v35);
        v42 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v75 + 1) + 8 * j), v38, (uint64_t)a3);
        objc_msgSend_addPotentialMatch_((void *)v10, v43, (uint64_t)v42);

      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v75, v84, 16);
    }
    while (v39);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v44 = self->_invitedKeyToRemoves;
  v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v71, v83, 16);
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v72 != v49)
          objc_enumerationMutation(v44);
        v51 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v71 + 1) + 8 * k), v47, (uint64_t)a3, (_QWORD)v71);
        objc_msgSend_addInvitedKeyToRemove_((void *)v10, v52, (uint64_t)v51);

      }
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v71, v83, 16);
    }
    while (v48);
  }

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v10 + 130) = self->_publisherModel;
    *(_BYTE *)(v10 + 132) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v10 + 128) = self->_anonymousPublicAccess;
    *(_BYTE *)(v10 + 132) |= 8u;
  }
  v55 = objc_msgSend_copyWithZone_(self->_displayedHostname, v53, (uint64_t)a3, (_QWORD)v71);
  v56 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v55;

  v58 = (char)self->_has;
  if ((v58 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_30;
LABEL_34:
    *(_DWORD *)(v10 + 56) = self->_participantSelfRemovalBehavior;
    *(_BYTE *)(v10 + 132) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
  *(_DWORD *)(v10 + 84) = self->_publisherModelType;
  *(_BYTE *)(v10 + 132) |= 4u;
  v58 = (char)self->_has;
  if ((v58 & 1) != 0)
    goto LABEL_34;
LABEL_30:
  if ((v58 & 0x10) != 0)
  {
LABEL_31:
    *(_BYTE *)(v10 + 129) = self->_denyAccessRequests;
    *(_BYTE *)(v10 + 132) |= 0x10u;
  }
LABEL_32:
  v59 = objc_msgSend_copyWithZone_(self->_requestingAccess, v57, (uint64_t)a3);
  v60 = *(void **)(v10 + 88);
  *(_QWORD *)(v10 + 88) = v59;

  v62 = objc_msgSend_copyWithZone_(self->_blockedRequestingAccess, v61, (uint64_t)a3);
  v63 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v62;

  v65 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v64, (uint64_t)a3);
  v66 = *(void **)(v10 + 112);
  *(_QWORD *)(v10 + 112) = v65;

  v68 = objc_msgSend_copyWithZone_(self->_origin, v67, (uint64_t)a3);
  v69 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v68;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPShareIdentifier *shareId;
  uint64_t v9;
  NSString *etag;
  uint64_t v11;
  CKDPProtectionInfo *invitedPcs;
  uint64_t v13;
  CKDPProtectionInfo *selfAddedPcs;
  uint64_t v15;
  NSMutableArray *participants;
  uint64_t v17;
  NSString *shortTokenRoutingKey;
  uint64_t v19;
  NSMutableArray *potentialMatchs;
  uint64_t v21;
  NSMutableArray *invitedKeyToRemoves;
  uint64_t v23;
  char has;
  char v25;
  NSString *displayedHostname;
  uint64_t v27;
  CKDPShareAccessRequesters *requestingAccess;
  uint64_t v29;
  CKDPShareAccessBlockedRequesters *blockedRequestingAccess;
  uint64_t v31;
  NSData *shortTokenHash;
  uint64_t v33;
  NSString *origin;
  uint64_t v35;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_68;
  shareId = self->_shareId;
  v9 = v4[13];
  if ((unint64_t)shareId | v9)
  {
    if (!objc_msgSend_isEqual_(shareId, v7, v9))
      goto LABEL_68;
  }
  etag = self->_etag;
  v11 = v4[3];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11))
      goto LABEL_68;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 2) == 0 || self->_publicAccess != *((_DWORD *)v4 + 20))
      goto LABEL_68;
  }
  else if ((*((_BYTE *)v4 + 132) & 2) != 0)
  {
    goto LABEL_68;
  }
  invitedPcs = self->_invitedPcs;
  v13 = v4[5];
  if ((unint64_t)invitedPcs | v13 && !objc_msgSend_isEqual_(invitedPcs, v7, v13))
    goto LABEL_68;
  selfAddedPcs = self->_selfAddedPcs;
  v15 = v4[12];
  if ((unint64_t)selfAddedPcs | v15)
  {
    if (!objc_msgSend_isEqual_(selfAddedPcs, v7, v15))
      goto LABEL_68;
  }
  participants = self->_participants;
  v17 = v4[8];
  if ((unint64_t)participants | v17)
  {
    if (!objc_msgSend_isEqual_(participants, v7, v17))
      goto LABEL_68;
  }
  shortTokenRoutingKey = self->_shortTokenRoutingKey;
  v19 = v4[15];
  if ((unint64_t)shortTokenRoutingKey | v19)
  {
    if (!objc_msgSend_isEqual_(shortTokenRoutingKey, v7, v19))
      goto LABEL_68;
  }
  potentialMatchs = self->_potentialMatchs;
  v21 = v4[9];
  if ((unint64_t)potentialMatchs | v21)
  {
    if (!objc_msgSend_isEqual_(potentialMatchs, v7, v21))
      goto LABEL_68;
  }
  invitedKeyToRemoves = self->_invitedKeyToRemoves;
  v23 = v4[4];
  if ((unint64_t)invitedKeyToRemoves | v23)
  {
    if (!objc_msgSend_isEqual_(invitedKeyToRemoves, v7, v23))
      goto LABEL_68;
  }
  has = (char)self->_has;
  v25 = *((_BYTE *)v4 + 132);
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 0x20) == 0)
      goto LABEL_68;
    if (self->_publisherModel)
    {
      if (!*((_BYTE *)v4 + 130))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 130))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_BYTE *)v4 + 132) & 0x20) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 8) == 0)
      goto LABEL_68;
    if (self->_anonymousPublicAccess)
    {
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 128))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_BYTE *)v4 + 132) & 8) != 0)
  {
    goto LABEL_68;
  }
  displayedHostname = self->_displayedHostname;
  v27 = v4[2];
  if ((unint64_t)displayedHostname | v27)
  {
    if (!objc_msgSend_isEqual_(displayedHostname, v7, v27))
      goto LABEL_68;
    has = (char)self->_has;
    v25 = *((_BYTE *)v4 + 132);
  }
  if ((has & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_publisherModelType != *((_DWORD *)v4 + 21))
      goto LABEL_68;
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 1) != 0)
  {
    if ((v25 & 1) == 0 || self->_participantSelfRemovalBehavior != *((_DWORD *)v4 + 14))
      goto LABEL_68;
  }
  else if ((v25 & 1) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x10) != 0)
  {
    if ((v25 & 0x10) != 0)
    {
      if (self->_denyAccessRequests)
      {
        if (!*((_BYTE *)v4 + 129))
          goto LABEL_68;
        goto LABEL_60;
      }
      if (!*((_BYTE *)v4 + 129))
        goto LABEL_60;
    }
LABEL_68:
    isEqual = 0;
    goto LABEL_69;
  }
  if ((v25 & 0x10) != 0)
    goto LABEL_68;
LABEL_60:
  requestingAccess = self->_requestingAccess;
  v29 = v4[11];
  if ((unint64_t)requestingAccess | v29 && !objc_msgSend_isEqual_(requestingAccess, v7, v29))
    goto LABEL_68;
  blockedRequestingAccess = self->_blockedRequestingAccess;
  v31 = v4[1];
  if ((unint64_t)blockedRequestingAccess | v31)
  {
    if (!objc_msgSend_isEqual_(blockedRequestingAccess, v7, v31))
      goto LABEL_68;
  }
  shortTokenHash = self->_shortTokenHash;
  v33 = v4[14];
  if ((unint64_t)shortTokenHash | v33)
  {
    if (!objc_msgSend_isEqual_(shortTokenHash, v7, v33))
      goto LABEL_68;
  }
  origin = self->_origin;
  v35 = v4[6];
  if ((unint64_t)origin | v35)
    isEqual = objc_msgSend_isEqual_(origin, v7, v35);
  else
    isEqual = 1;
LABEL_69:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v46 = objc_msgSend_hash(self->_shareId, a2, v2);
  v45 = objc_msgSend_hash(self->_etag, v4, v5);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v44 = 2654435761 * self->_publicAccess;
  else
    v44 = 0;
  v43 = objc_msgSend_hash(self->_invitedPcs, v6, v7);
  v10 = objc_msgSend_hash(self->_selfAddedPcs, v8, v9);
  v13 = objc_msgSend_hash(self->_participants, v11, v12);
  v16 = objc_msgSend_hash(self->_shortTokenRoutingKey, v14, v15);
  v19 = objc_msgSend_hash(self->_potentialMatchs, v17, v18);
  v24 = objc_msgSend_hash(self->_invitedKeyToRemoves, v20, v21);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v25 = 2654435761 * self->_publisherModel;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  else
  {
    v25 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v26 = 2654435761 * self->_anonymousPublicAccess;
      goto LABEL_9;
    }
  }
  v26 = 0;
LABEL_9:
  v27 = objc_msgSend_hash(self->_displayedHostname, v22, v23);
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v30 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_11;
LABEL_14:
    v31 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_12;
LABEL_15:
    v32 = 0;
    goto LABEL_16;
  }
  v30 = 2654435761 * self->_publisherModelType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_11:
  v31 = 2654435761 * self->_participantSelfRemovalBehavior;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_15;
LABEL_12:
  v32 = 2654435761 * self->_denyAccessRequests;
LABEL_16:
  v33 = v45 ^ v46 ^ v44 ^ v43 ^ v10 ^ v13 ^ v16 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v30 ^ v31 ^ v32 ^ objc_msgSend_hash(self->_requestingAccess, v28, v29);
  v36 = objc_msgSend_hash(self->_blockedRequestingAccess, v34, v35);
  v39 = v36 ^ objc_msgSend_hash(self->_shortTokenHash, v37, v38);
  return v33 ^ v39 ^ objc_msgSend_hash(self->_origin, v40, v41);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPShareIdentifier *shareId;
  uint64_t v7;
  uint64_t v8;
  CKDPProtectionInfo *invitedPcs;
  uint64_t v10;
  CKDPProtectionInfo *selfAddedPcs;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  const char *v36;
  char v37;
  uint64_t v38;
  char v39;
  CKDPShareAccessRequesters *requestingAccess;
  uint64_t v41;
  CKDPShareAccessBlockedRequesters *blockedRequestingAccess;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
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
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  shareId = self->_shareId;
  v7 = *((_QWORD *)v5 + 13);
  if (shareId)
  {
    if (v7)
      objc_msgSend_mergeFrom_(shareId, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setShareId_(self, v4, v7);
  }
  v8 = *((_QWORD *)v5 + 3);
  if (v8)
    objc_msgSend_setEtag_(self, v4, v8);
  if ((*((_BYTE *)v5 + 132) & 2) != 0)
  {
    self->_publicAccess = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
  invitedPcs = self->_invitedPcs;
  v10 = *((_QWORD *)v5 + 5);
  if (invitedPcs)
  {
    if (v10)
      objc_msgSend_mergeFrom_(invitedPcs, v4, v10);
  }
  else if (v10)
  {
    objc_msgSend_setInvitedPcs_(self, v4, v10);
  }
  selfAddedPcs = self->_selfAddedPcs;
  v12 = *((_QWORD *)v5 + 12);
  if (selfAddedPcs)
  {
    if (v12)
      objc_msgSend_mergeFrom_(selfAddedPcs, v4, v12);
  }
  else if (v12)
  {
    objc_msgSend_setSelfAddedPcs_(self, v4, v12);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v13 = *((id *)v5 + 8);
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v54, v60, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(v13);
        objc_msgSend_addParticipant_(self, v16, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v54, v60, 16);
    }
    while (v17);
  }

  v21 = *((_QWORD *)v5 + 15);
  if (v21)
    objc_msgSend_setShortTokenRoutingKey_(self, v20, v21);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v22 = *((id *)v5 + 9);
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v50, v59, 16);
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v22);
        objc_msgSend_addPotentialMatch_(self, v25, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v50, v59, 16);
    }
    while (v26);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = *((id *)v5 + 4);
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v46, v58, 16);
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v47 != v34)
          objc_enumerationMutation(v29);
        objc_msgSend_addInvitedKeyToRemove_(self, v32, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k), (_QWORD)v46);
      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v46, v58, 16);
    }
    while (v33);
  }

  v37 = *((_BYTE *)v5 + 132);
  if ((v37 & 0x20) != 0)
  {
    self->_publisherModel = *((_BYTE *)v5 + 130);
    *(_BYTE *)&self->_has |= 0x20u;
    v37 = *((_BYTE *)v5 + 132);
  }
  if ((v37 & 8) != 0)
  {
    self->_anonymousPublicAccess = *((_BYTE *)v5 + 128);
    *(_BYTE *)&self->_has |= 8u;
  }
  v38 = *((_QWORD *)v5 + 2);
  if (v38)
    objc_msgSend_setDisplayedHostname_(self, v36, v38);
  v39 = *((_BYTE *)v5 + 132);
  if ((v39 & 4) != 0)
  {
    self->_publisherModelType = *((_DWORD *)v5 + 21);
    *(_BYTE *)&self->_has |= 4u;
    v39 = *((_BYTE *)v5 + 132);
    if ((v39 & 1) == 0)
    {
LABEL_51:
      if ((v39 & 0x10) == 0)
        goto LABEL_53;
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v5 + 132) & 1) == 0)
  {
    goto LABEL_51;
  }
  self->_participantSelfRemovalBehavior = *((_DWORD *)v5 + 14);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v5 + 132) & 0x10) != 0)
  {
LABEL_52:
    self->_denyAccessRequests = *((_BYTE *)v5 + 129);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_53:
  requestingAccess = self->_requestingAccess;
  v41 = *((_QWORD *)v5 + 11);
  if (requestingAccess)
  {
    if (v41)
      objc_msgSend_mergeFrom_(requestingAccess, v36, v41);
  }
  else if (v41)
  {
    objc_msgSend_setRequestingAccess_(self, v36, v41);
  }
  blockedRequestingAccess = self->_blockedRequestingAccess;
  v43 = *((_QWORD *)v5 + 1);
  if (blockedRequestingAccess)
  {
    if (v43)
      objc_msgSend_mergeFrom_(blockedRequestingAccess, v36, v43);
  }
  else if (v43)
  {
    objc_msgSend_setBlockedRequestingAccess_(self, v36, v43);
  }
  v44 = *((_QWORD *)v5 + 14);
  if (v44)
    objc_msgSend_setShortTokenHash_(self, v36, v44);
  v45 = *((_QWORD *)v5 + 6);
  if (v45)
    objc_msgSend_setOrigin_(self, v36, v45);

}

- (CKDPShareIdentifier)shareId
{
  return self->_shareId;
}

- (void)setShareId:(id)a3
{
  objc_storeStrong((id *)&self->_shareId, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (CKDPProtectionInfo)invitedPcs
{
  return self->_invitedPcs;
}

- (void)setInvitedPcs:(id)a3
{
  objc_storeStrong((id *)&self->_invitedPcs, a3);
}

- (CKDPProtectionInfo)selfAddedPcs
{
  return self->_selfAddedPcs;
}

- (void)setSelfAddedPcs:(id)a3
{
  objc_storeStrong((id *)&self->_selfAddedPcs, a3);
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSString)shortTokenRoutingKey
{
  return self->_shortTokenRoutingKey;
}

- (void)setShortTokenRoutingKey:(id)a3
{
  objc_storeStrong((id *)&self->_shortTokenRoutingKey, a3);
}

- (NSMutableArray)potentialMatchs
{
  return self->_potentialMatchs;
}

- (void)setPotentialMatchs:(id)a3
{
  objc_storeStrong((id *)&self->_potentialMatchs, a3);
}

- (NSMutableArray)invitedKeyToRemoves
{
  return self->_invitedKeyToRemoves;
}

- (void)setInvitedKeyToRemoves:(id)a3
{
  objc_storeStrong((id *)&self->_invitedKeyToRemoves, a3);
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (void)setDisplayedHostname:(id)a3
{
  objc_storeStrong((id *)&self->_displayedHostname, a3);
}

- (CKDPShareAccessRequesters)requestingAccess
{
  return self->_requestingAccess;
}

- (void)setRequestingAccess:(id)a3
{
  objc_storeStrong((id *)&self->_requestingAccess, a3);
}

- (CKDPShareAccessBlockedRequesters)blockedRequestingAccess
{
  return self->_blockedRequestingAccess;
}

- (void)setBlockedRequestingAccess:(id)a3
{
  objc_storeStrong((id *)&self->_blockedRequestingAccess, a3);
}

- (NSData)shortTokenHash
{
  return self->_shortTokenHash;
}

- (void)setShortTokenHash:(id)a3
{
  objc_storeStrong((id *)&self->_shortTokenHash, a3);
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTokenRoutingKey, 0);
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_selfAddedPcs, 0);
  objc_storeStrong((id *)&self->_requestingAccess, 0);
  objc_storeStrong((id *)&self->_potentialMatchs, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_invitedPcs, 0);
  objc_storeStrong((id *)&self->_invitedKeyToRemoves, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_blockedRequestingAccess, 0);
}

@end
