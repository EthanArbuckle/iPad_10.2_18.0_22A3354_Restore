@implementation CKDPParticipant

- (id)_stateCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_state(self, a2, v2);
  if ((v3 - 1) < 4)
    return off_1E78343E0[(int)v3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_participantTypeCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_participantType(self, a2, v2);
  if ((v3 - 1) < 4)
    return off_1E7834400[(int)v3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_permissionCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_permission(self, a2, v2);
  if ((v3 - 1) < 4)
    return off_1E7834420[(int)v3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasContactInformation
{
  return self->_contactInformation != 0;
}

- (int)state
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_state;
  else
    return 1;
}

- (void)setState:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasState
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)stateAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E78363A0[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsState:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("invited")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("accepted")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("removed")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("unsubscribed")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int)participantType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_participantType;
  else
    return 1;
}

- (void)setParticipantType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_participantType = a3;
}

- (void)setHasParticipantType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasParticipantType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)participantTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E78363C0[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParticipantType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("owner")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("administrator")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("user")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("publicUser")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int)permission
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_permission;
  else
    return 1;
}

- (void)setPermission:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_permission = a3;
}

- (void)setHasPermission:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPermission
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)permissionAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E78363E0[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPermission:(id)a3
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

- (BOOL)hasInviterId
{
  return self->_inviterId != 0;
}

- (void)setCreatedInProcess:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_createdInProcess = a3;
}

- (void)setHasCreatedInProcess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCreatedInProcess
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasPublicKey
{
  return self->_publicKey != 0;
}

- (void)setAcceptTimestamp:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_acceptTimestamp = a3;
}

- (void)setHasAcceptTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAcceptTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasOutOfNetworkPrivateKey
{
  return self->_outOfNetworkPrivateKey != 0;
}

- (void)setOutOfNetworkKeyType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_outOfNetworkKeyType = a3;
}

- (void)setHasOutOfNetworkKeyType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasOutOfNetworkKeyType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)publicKeyVersion
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_publicKeyVersion;
  else
    return 1;
}

- (void)setPublicKeyVersion:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_publicKeyVersion = a3;
}

- (void)setHasPublicKeyVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPublicKeyVersion
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_acceptedInProcess = a3;
}

- (void)setHasAcceptedInProcess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAcceptedInProcess
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsInNetwork:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isInNetwork = a3;
}

- (void)setHasIsInNetwork:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsInNetwork
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasAcceptedTimestampDate
{
  return self->_acceptedTimestampDate != 0;
}

- (void)setIsOrgUser:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isOrgUser = a3;
}

- (void)setHasIsOrgUser:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsOrgUser
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasProtectionInfoPublicKey
{
  return self->_protectionInfoPublicKey != 0;
}

- (int)keyHealth
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_keyHealth;
  else
    return 1;
}

- (void)setKeyHealth:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_keyHealth = a3;
}

- (void)setHasKeyHealth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasKeyHealth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)keyHealthAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7836400[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKeyHealth:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("healthy")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("expired")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("keylost")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasInviteTimestampDate
{
  return self->_inviteTimestampDate != 0;
}

- (void)setIsAnonymousInvitedParticipant:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isAnonymousInvitedParticipant = a3;
}

- (void)setHasIsAnonymousInvitedParticipant:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsAnonymousInvitedParticipant
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsApprovedRequester:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isApprovedRequester = a3;
}

- (void)setHasIsApprovedRequester:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsApprovedRequester
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasEncryptedContactInformation
{
  return self->_encryptedContactInformation != 0;
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
  v11.super_class = (Class)CKDPParticipant;
  -[CKDPParticipant description](&v11, sel_description);
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
  CKDPIdentifier *participantId;
  void *v8;
  const char *v9;
  CKDPIdentifier *userId;
  void *v11;
  const char *v12;
  CKDPContactInformation *contactInformation;
  void *v14;
  const char *v15;
  __int16 has;
  unsigned int v17;
  __CFString *v18;
  unsigned int v19;
  __CFString *v20;
  unsigned int v21;
  __CFString *v22;
  CKDPIdentifier *inviterId;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  CKDPProtectionInfo *publicKey;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  CKDPProtectionInfo *protectionInfo;
  void *v34;
  const char *v35;
  NSData *outOfNetworkPrivateKey;
  __int16 v37;
  void *v38;
  const char *v39;
  CKDPDate *acceptedTimestampDate;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  NSData *protectionInfoPublicKey;
  unsigned int v46;
  __CFString *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  CKDPDate *inviteTimestampDate;
  void *v55;
  const char *v56;
  __int16 v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  NSData *encryptedContactInformation;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  participantId = self->_participantId;
  if (participantId)
  {
    objc_msgSend_dictionaryRepresentation(participantId, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("participantId"));

  }
  userId = self->_userId;
  if (userId)
  {
    objc_msgSend_dictionaryRepresentation(userId, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("userId"));

  }
  contactInformation = self->_contactInformation;
  if (contactInformation)
  {
    objc_msgSend_dictionaryRepresentation(contactInformation, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("contactInformation"));

  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v17 = self->_state - 1;
    if (v17 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_state);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E78363A0[v17];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v18, CFSTR("state"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  v19 = self->_participantType - 1;
  if (v19 >= 4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_participantType);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E78363C0[v19];
  }
  objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v20, CFSTR("participantType"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_19:
    v21 = self->_permission - 1;
    if (v21 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_permission);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E78363E0[v21];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v22, CFSTR("permission"));

  }
LABEL_23:
  inviterId = self->_inviterId;
  if (inviterId)
  {
    objc_msgSend_dictionaryRepresentation(inviterId, v4, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, CFSTR("inviterId"));

  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_createdInProcess);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, CFSTR("createdInProcess"));

  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    objc_msgSend_dictionaryRepresentation(publicKey, v4, v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, CFSTR("publicKey"));

  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_acceptTimestamp);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, CFSTR("acceptTimestamp"));

  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_dictionaryRepresentation(protectionInfo, v4, v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v35, (uint64_t)v34, CFSTR("protectionInfo"));

  }
  outOfNetworkPrivateKey = self->_outOfNetworkPrivateKey;
  if (outOfNetworkPrivateKey)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)outOfNetworkPrivateKey, CFSTR("outOfNetworkPrivateKey"));
  v37 = (__int16)self->_has;
  if ((v37 & 4) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_outOfNetworkKeyType);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v49, (uint64_t)v48, CFSTR("outOfNetworkKeyType"));

    v37 = (__int16)self->_has;
    if ((v37 & 0x20) == 0)
    {
LABEL_37:
      if ((v37 & 0x80) == 0)
        goto LABEL_38;
      goto LABEL_51;
    }
  }
  else if ((v37 & 0x20) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_publicKeyVersion);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)v50, CFSTR("publicKeyVersion"));

  v37 = (__int16)self->_has;
  if ((v37 & 0x80) == 0)
  {
LABEL_38:
    if ((v37 & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_51:
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_acceptedInProcess);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v53, (uint64_t)v52, CFSTR("acceptedInProcess"));

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_39:
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_isInNetwork);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v39, (uint64_t)v38, CFSTR("isInNetwork"));

  }
LABEL_40:
  acceptedTimestampDate = self->_acceptedTimestampDate;
  if (acceptedTimestampDate)
  {
    objc_msgSend_dictionaryRepresentation(acceptedTimestampDate, v4, (uint64_t)outOfNetworkPrivateKey);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v42, (uint64_t)v41, CFSTR("acceptedTimestampDate"));

  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_isOrgUser);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v44, (uint64_t)v43, CFSTR("isOrgUser"));

  }
  protectionInfoPublicKey = self->_protectionInfoPublicKey;
  if (protectionInfoPublicKey)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)protectionInfoPublicKey, CFSTR("protectionInfoPublicKey"));
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v46 = self->_keyHealth - 1;
    if (v46 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_keyHealth);
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_1E7836400[v46];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v47, CFSTR("keyHealth"));

  }
  inviteTimestampDate = self->_inviteTimestampDate;
  if (inviteTimestampDate)
  {
    objc_msgSend_dictionaryRepresentation(inviteTimestampDate, v4, (uint64_t)protectionInfoPublicKey);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v56, (uint64_t)v55, CFSTR("inviteTimestampDate"));

  }
  v57 = (__int16)self->_has;
  if ((v57 & 0x200) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_isAnonymousInvitedParticipant);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v59, (uint64_t)v58, CFSTR("isAnonymousInvitedParticipant"));

    v57 = (__int16)self->_has;
  }
  if ((v57 & 0x400) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_isApprovedRequester);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v61, (uint64_t)v60, CFSTR("isApprovedRequester"));

  }
  encryptedContactInformation = self->_encryptedContactInformation;
  if (encryptedContactInformation)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)encryptedContactInformation, CFSTR("encryptedContactInformation"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPParticipantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_participantId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_userId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_contactInformation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
LABEL_11:
  if (self->_inviterId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_publicKey)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }
  if (self->_protectionInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_outOfNetworkPrivateKey)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
    v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_25:
      if ((v6 & 0x80) == 0)
        goto LABEL_26;
      goto LABEL_50;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteInt32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_26:
    if ((v6 & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_27:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_28:
  if (self->_acceptedTimestampDate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_protectionInfoPublicKey)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_inviteTimestampDate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_encryptedContactInformation)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPIdentifier *participantId;
  CKDPIdentifier *userId;
  CKDPContactInformation *contactInformation;
  __int16 has;
  CKDPIdentifier *inviterId;
  CKDPProtectionInfo *publicKey;
  CKDPProtectionInfo *protectionInfo;
  NSData *outOfNetworkPrivateKey;
  __int16 v14;
  CKDPDate *acceptedTimestampDate;
  NSData *protectionInfoPublicKey;
  CKDPDate *inviteTimestampDate;
  __int16 v18;
  NSData *encryptedContactInformation;
  id v20;

  v4 = a3;
  participantId = self->_participantId;
  v20 = v4;
  if (participantId)
  {
    objc_msgSend_setParticipantId_(v4, v5, (uint64_t)participantId);
    v4 = v20;
  }
  userId = self->_userId;
  if (userId)
  {
    objc_msgSend_setUserId_(v20, v5, (uint64_t)userId);
    v4 = v20;
  }
  contactInformation = self->_contactInformation;
  if (contactInformation)
  {
    objc_msgSend_setContactInformation_(v20, v5, (uint64_t)contactInformation);
    v4 = v20;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 29) = self->_state;
    *((_WORD *)v4 + 68) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 20) = self->_participantType;
  *((_WORD *)v4 + 68) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 21) = self->_permission;
    *((_WORD *)v4 + 68) |= 0x10u;
  }
LABEL_11:
  inviterId = self->_inviterId;
  if (inviterId)
  {
    objc_msgSend_setInviterId_(v20, v5, (uint64_t)inviterId);
    v4 = v20;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_BYTE *)v4 + 129) = self->_createdInProcess;
    *((_WORD *)v4 + 68) |= 0x100u;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    objc_msgSend_setPublicKey_(v20, v5, (uint64_t)publicKey);
    v4 = v20;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_acceptTimestamp;
    *((_WORD *)v4 + 68) |= 1u;
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v20, v5, (uint64_t)protectionInfo);
    v4 = v20;
  }
  outOfNetworkPrivateKey = self->_outOfNetworkPrivateKey;
  if (outOfNetworkPrivateKey)
  {
    objc_msgSend_setOutOfNetworkPrivateKey_(v20, v5, (uint64_t)outOfNetworkPrivateKey);
    v4 = v20;
  }
  v14 = (__int16)self->_has;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_outOfNetworkKeyType;
    *((_WORD *)v4 + 68) |= 4u;
    v14 = (__int16)self->_has;
    if ((v14 & 0x20) == 0)
    {
LABEL_25:
      if ((v14 & 0x80) == 0)
        goto LABEL_26;
      goto LABEL_50;
    }
  }
  else if ((v14 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v4 + 28) = self->_publicKeyVersion;
  *((_WORD *)v4 + 68) |= 0x20u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x80) == 0)
  {
LABEL_26:
    if ((v14 & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_50:
  *((_BYTE *)v4 + 128) = self->_acceptedInProcess;
  *((_WORD *)v4 + 68) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_27:
    *((_BYTE *)v4 + 132) = self->_isInNetwork;
    *((_WORD *)v4 + 68) |= 0x800u;
  }
LABEL_28:
  acceptedTimestampDate = self->_acceptedTimestampDate;
  if (acceptedTimestampDate)
  {
    objc_msgSend_setAcceptedTimestampDate_(v20, v5, (uint64_t)acceptedTimestampDate);
    v4 = v20;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *((_BYTE *)v4 + 133) = self->_isOrgUser;
    *((_WORD *)v4 + 68) |= 0x1000u;
  }
  protectionInfoPublicKey = self->_protectionInfoPublicKey;
  if (protectionInfoPublicKey)
  {
    objc_msgSend_setProtectionInfoPublicKey_(v20, v5, (uint64_t)protectionInfoPublicKey);
    v4 = v20;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_keyHealth;
    *((_WORD *)v4 + 68) |= 2u;
  }
  inviteTimestampDate = self->_inviteTimestampDate;
  if (inviteTimestampDate)
  {
    objc_msgSend_setInviteTimestampDate_(v20, v5, (uint64_t)inviteTimestampDate);
    v4 = v20;
  }
  v18 = (__int16)self->_has;
  if ((v18 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 130) = self->_isAnonymousInvitedParticipant;
    *((_WORD *)v4 + 68) |= 0x200u;
    v18 = (__int16)self->_has;
  }
  if ((v18 & 0x400) != 0)
  {
    *((_BYTE *)v4 + 131) = self->_isApprovedRequester;
    *((_WORD *)v4 + 68) |= 0x400u;
  }
  encryptedContactInformation = self->_encryptedContactInformation;
  if (encryptedContactInformation)
  {
    objc_msgSend_setEncryptedContactInformation_(v20, v5, (uint64_t)encryptedContactInformation);
    v4 = v20;
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
  __int16 has;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  __int16 v44;
  uint64_t v45;
  void *v46;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_participantId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 72);
  *(_QWORD *)(v10 + 72) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_userId, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 120);
  *(_QWORD *)(v10 + 120) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_contactInformation, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v18;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v10 + 116) = self->_state;
    *(_WORD *)(v10 + 136) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v10 + 80) = self->_participantType;
  *(_WORD *)(v10 + 136) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(_DWORD *)(v10 + 84) = self->_permission;
    *(_WORD *)(v10 + 136) |= 0x10u;
  }
LABEL_5:
  v22 = objc_msgSend_copyWithZone_(self->_inviterId, v20, (uint64_t)a3);
  v23 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v22;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_BYTE *)(v10 + 129) = self->_createdInProcess;
    *(_WORD *)(v10 + 136) |= 0x100u;
  }
  v25 = objc_msgSend_copyWithZone_(self->_publicKey, v24, (uint64_t)a3);
  v26 = *(void **)(v10 + 104);
  *(_QWORD *)(v10 + 104) = v25;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_acceptTimestamp;
    *(_WORD *)(v10 + 136) |= 1u;
  }
  v28 = objc_msgSend_copyWithZone_(self->_protectionInfo, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 88);
  *(_QWORD *)(v10 + 88) = v28;

  v31 = objc_msgSend_copyWithZone_(self->_outOfNetworkPrivateKey, v30, (uint64_t)a3);
  v32 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = v31;

  v34 = (__int16)self->_has;
  if ((v34 & 4) != 0)
  {
    *(_DWORD *)(v10 + 60) = self->_outOfNetworkKeyType;
    *(_WORD *)(v10 + 136) |= 4u;
    v34 = (__int16)self->_has;
    if ((v34 & 0x20) == 0)
    {
LABEL_11:
      if ((v34 & 0x80) == 0)
        goto LABEL_12;
      goto LABEL_28;
    }
  }
  else if ((v34 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v10 + 112) = self->_publicKeyVersion;
  *(_WORD *)(v10 + 136) |= 0x20u;
  v34 = (__int16)self->_has;
  if ((v34 & 0x80) == 0)
  {
LABEL_12:
    if ((v34 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_28:
  *(_BYTE *)(v10 + 128) = self->_acceptedInProcess;
  *(_WORD *)(v10 + 136) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    *(_BYTE *)(v10 + 132) = self->_isInNetwork;
    *(_WORD *)(v10 + 136) |= 0x800u;
  }
LABEL_14:
  v35 = objc_msgSend_copyWithZone_(self->_acceptedTimestampDate, v33, (uint64_t)a3);
  v36 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v35;

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *(_BYTE *)(v10 + 133) = self->_isOrgUser;
    *(_WORD *)(v10 + 136) |= 0x1000u;
  }
  v38 = objc_msgSend_copyWithZone_(self->_protectionInfoPublicKey, v37, (uint64_t)a3);
  v39 = *(void **)(v10 + 96);
  *(_QWORD *)(v10 + 96) = v38;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v10 + 56) = self->_keyHealth;
    *(_WORD *)(v10 + 136) |= 2u;
  }
  v41 = objc_msgSend_copyWithZone_(self->_inviteTimestampDate, v40, (uint64_t)a3);
  v42 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v41;

  v44 = (__int16)self->_has;
  if ((v44 & 0x200) != 0)
  {
    *(_BYTE *)(v10 + 130) = self->_isAnonymousInvitedParticipant;
    *(_WORD *)(v10 + 136) |= 0x200u;
    v44 = (__int16)self->_has;
  }
  if ((v44 & 0x400) != 0)
  {
    *(_BYTE *)(v10 + 131) = self->_isApprovedRequester;
    *(_WORD *)(v10 + 136) |= 0x400u;
  }
  v45 = objc_msgSend_copyWithZone_(self->_encryptedContactInformation, v43, (uint64_t)a3);
  v46 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v45;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPIdentifier *participantId;
  uint64_t v9;
  CKDPIdentifier *userId;
  uint64_t v11;
  CKDPContactInformation *contactInformation;
  uint64_t v13;
  __int16 has;
  __int16 v15;
  CKDPIdentifier *inviterId;
  uint64_t v17;
  CKDPProtectionInfo *publicKey;
  uint64_t v19;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v21;
  NSData *outOfNetworkPrivateKey;
  uint64_t v23;
  __int16 v24;
  __int16 v25;
  CKDPDate *acceptedTimestampDate;
  uint64_t v27;
  NSData *protectionInfoPublicKey;
  uint64_t v29;
  CKDPDate *inviteTimestampDate;
  uint64_t v31;
  char isEqual;
  NSData *encryptedContactInformation;
  uint64_t v35;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_106;
  participantId = self->_participantId;
  v9 = v4[9];
  if ((unint64_t)participantId | v9)
  {
    if (!objc_msgSend_isEqual_(participantId, v7, v9))
      goto LABEL_106;
  }
  userId = self->_userId;
  v11 = v4[15];
  if ((unint64_t)userId | v11)
  {
    if (!objc_msgSend_isEqual_(userId, v7, v11))
      goto LABEL_106;
  }
  contactInformation = self->_contactInformation;
  v13 = v4[3];
  if ((unint64_t)contactInformation | v13)
  {
    if (!objc_msgSend_isEqual_(contactInformation, v7, v13))
      goto LABEL_106;
  }
  has = (__int16)self->_has;
  v15 = *((_WORD *)v4 + 68);
  if ((has & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_state != *((_DWORD *)v4 + 29))
      goto LABEL_106;
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_participantType != *((_DWORD *)v4 + 20))
      goto LABEL_106;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_permission != *((_DWORD *)v4 + 21))
      goto LABEL_106;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  inviterId = self->_inviterId;
  v17 = v4[6];
  if ((unint64_t)inviterId | v17)
  {
    if (!objc_msgSend_isEqual_(inviterId, v7, v17))
      goto LABEL_106;
    has = (__int16)self->_has;
    v15 = *((_WORD *)v4 + 68);
  }
  if ((has & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0)
      goto LABEL_106;
    if (self->_createdInProcess)
    {
      if (!*((_BYTE *)v4 + 129))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 129))
    {
      goto LABEL_106;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_106;
  }
  publicKey = self->_publicKey;
  v19 = v4[13];
  if ((unint64_t)publicKey | v19)
  {
    if (!objc_msgSend_isEqual_(publicKey, v7, v19))
      goto LABEL_106;
    has = (__int16)self->_has;
    v15 = *((_WORD *)v4 + 68);
  }
  if ((has & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_acceptTimestamp != v4[1])
      goto LABEL_106;
  }
  else if ((v15 & 1) != 0)
  {
    goto LABEL_106;
  }
  protectionInfo = self->_protectionInfo;
  v21 = v4[11];
  if ((unint64_t)protectionInfo | v21 && !objc_msgSend_isEqual_(protectionInfo, v7, v21))
    goto LABEL_106;
  outOfNetworkPrivateKey = self->_outOfNetworkPrivateKey;
  v23 = v4[8];
  if ((unint64_t)outOfNetworkPrivateKey | v23)
  {
    if (!objc_msgSend_isEqual_(outOfNetworkPrivateKey, v7, v23))
      goto LABEL_106;
  }
  v24 = (__int16)self->_has;
  v25 = *((_WORD *)v4 + 68);
  if ((v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_outOfNetworkKeyType != *((_DWORD *)v4 + 15))
      goto LABEL_106;
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((v24 & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0 || self->_publicKeyVersion != *((_DWORD *)v4 + 28))
      goto LABEL_106;
  }
  else if ((v25 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  if ((v24 & 0x80) != 0)
  {
    if ((v25 & 0x80) == 0)
      goto LABEL_106;
    if (self->_acceptedInProcess)
    {
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 128))
    {
      goto LABEL_106;
    }
  }
  else if ((v25 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((v4[17] & 0x800) == 0)
      goto LABEL_106;
    if (self->_isInNetwork)
    {
      if (!*((_BYTE *)v4 + 132))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 132))
    {
      goto LABEL_106;
    }
  }
  else if ((v4[17] & 0x800) != 0)
  {
    goto LABEL_106;
  }
  acceptedTimestampDate = self->_acceptedTimestampDate;
  v27 = v4[2];
  if ((unint64_t)acceptedTimestampDate | v27)
  {
    if (!objc_msgSend_isEqual_(acceptedTimestampDate, v7, v27))
      goto LABEL_106;
    v24 = (__int16)self->_has;
    v25 = *((_WORD *)v4 + 68);
  }
  if ((v24 & 0x1000) != 0)
  {
    if ((v25 & 0x1000) == 0)
      goto LABEL_106;
    if (self->_isOrgUser)
    {
      if (!*((_BYTE *)v4 + 133))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 133))
    {
      goto LABEL_106;
    }
  }
  else if ((v25 & 0x1000) != 0)
  {
    goto LABEL_106;
  }
  protectionInfoPublicKey = self->_protectionInfoPublicKey;
  v29 = v4[12];
  if ((unint64_t)protectionInfoPublicKey | v29)
  {
    if (!objc_msgSend_isEqual_(protectionInfoPublicKey, v7, v29))
      goto LABEL_106;
    v24 = (__int16)self->_has;
    v25 = *((_WORD *)v4 + 68);
  }
  if ((v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_keyHealth != *((_DWORD *)v4 + 14))
      goto LABEL_106;
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_106;
  }
  inviteTimestampDate = self->_inviteTimestampDate;
  v31 = v4[5];
  if ((unint64_t)inviteTimestampDate | v31)
  {
    if (!objc_msgSend_isEqual_(inviteTimestampDate, v7, v31))
      goto LABEL_106;
    v24 = (__int16)self->_has;
    v25 = *((_WORD *)v4 + 68);
  }
  if ((v24 & 0x200) != 0)
  {
    if ((v25 & 0x200) == 0)
      goto LABEL_106;
    if (self->_isAnonymousInvitedParticipant)
    {
      if (!*((_BYTE *)v4 + 130))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 130))
    {
      goto LABEL_106;
    }
  }
  else if ((v25 & 0x200) != 0)
  {
    goto LABEL_106;
  }
  if ((v24 & 0x400) == 0)
  {
    if ((v25 & 0x400) == 0)
      goto LABEL_112;
LABEL_106:
    isEqual = 0;
    goto LABEL_107;
  }
  if ((v25 & 0x400) == 0)
    goto LABEL_106;
  if (!self->_isApprovedRequester)
  {
    if (!*((_BYTE *)v4 + 131))
      goto LABEL_112;
    goto LABEL_106;
  }
  if (!*((_BYTE *)v4 + 131))
    goto LABEL_106;
LABEL_112:
  encryptedContactInformation = self->_encryptedContactInformation;
  v35 = v4[4];
  if ((unint64_t)encryptedContactInformation | v35)
    isEqual = objc_msgSend_isEqual_(encryptedContactInformation, v7, v35);
  else
    isEqual = 1;
LABEL_107:

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
  __int16 has;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v49 = objc_msgSend_hash(self->_participantId, a2, v2);
  v48 = objc_msgSend_hash(self->_userId, v4, v5);
  v47 = objc_msgSend_hash(self->_contactInformation, v6, v7);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    v46 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v45 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v46 = 2654435761 * self->_state;
  if ((has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v45 = 2654435761 * self->_participantType;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v44 = 2654435761 * self->_permission;
    goto LABEL_8;
  }
LABEL_7:
  v44 = 0;
LABEL_8:
  v43 = objc_msgSend_hash(self->_inviterId, v8, v9);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v42 = 2654435761 * self->_createdInProcess;
  else
    v42 = 0;
  v41 = objc_msgSend_hash(self->_publicKey, v11, v12);
  if ((*(_WORD *)&self->_has & 1) != 0)
    v40 = 2654435761 * self->_acceptTimestamp;
  else
    v40 = 0;
  v39 = objc_msgSend_hash(self->_protectionInfo, v13, v14);
  v38 = objc_msgSend_hash(self->_outOfNetworkPrivateKey, v15, v16);
  v19 = (__int16)self->_has;
  if ((v19 & 4) != 0)
  {
    v37 = 2654435761 * self->_outOfNetworkKeyType;
    if ((v19 & 0x20) != 0)
    {
LABEL_16:
      v20 = 2654435761 * self->_publicKeyVersion;
      if ((v19 & 0x80) != 0)
        goto LABEL_17;
LABEL_21:
      v21 = 0;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_18;
      goto LABEL_22;
    }
  }
  else
  {
    v37 = 0;
    if ((v19 & 0x20) != 0)
      goto LABEL_16;
  }
  v20 = 0;
  if ((v19 & 0x80) == 0)
    goto LABEL_21;
LABEL_17:
  v21 = 2654435761 * self->_acceptedInProcess;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_18:
    v22 = 2654435761 * self->_isInNetwork;
    goto LABEL_23;
  }
LABEL_22:
  v22 = 0;
LABEL_23:
  v25 = objc_msgSend_hash(self->_acceptedTimestampDate, v17, v18);
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    v26 = 2654435761 * self->_isOrgUser;
  else
    v26 = 0;
  v29 = objc_msgSend_hash(self->_protectionInfoPublicKey, v23, v24);
  if ((*(_WORD *)&self->_has & 2) != 0)
    v30 = 2654435761 * self->_keyHealth;
  else
    v30 = 0;
  v31 = objc_msgSend_hash(self->_inviteTimestampDate, v27, v28);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v34 = 2654435761 * self->_isAnonymousInvitedParticipant;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_31;
LABEL_33:
    v35 = 0;
    return v48 ^ v49 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v20 ^ v21 ^ v22 ^ v25 ^ v26 ^ v29 ^ v30 ^ v31 ^ v34 ^ v35 ^ objc_msgSend_hash(self->_encryptedContactInformation, v32, v33);
  }
  v34 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_33;
LABEL_31:
  v35 = 2654435761 * self->_isApprovedRequester;
  return v48 ^ v49 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v20 ^ v21 ^ v22 ^ v25 ^ v26 ^ v29 ^ v30 ^ v31 ^ v34 ^ v35 ^ objc_msgSend_hash(self->_encryptedContactInformation, v32, v33);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPIdentifier *participantId;
  uint64_t v6;
  CKDPIdentifier *userId;
  uint64_t v8;
  CKDPContactInformation *contactInformation;
  uint64_t v10;
  __int16 v11;
  CKDPIdentifier *inviterId;
  uint64_t v13;
  CKDPProtectionInfo *publicKey;
  uint64_t v15;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  CKDPDate *acceptedTimestampDate;
  uint64_t v21;
  uint64_t v22;
  CKDPDate *inviteTimestampDate;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  id v27;

  v4 = a3;
  participantId = self->_participantId;
  v6 = *((_QWORD *)v4 + 9);
  v27 = v4;
  if (participantId)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(participantId, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setParticipantId_(self, (const char *)v4, v6);
  }
  v4 = v27;
LABEL_7:
  userId = self->_userId;
  v8 = *((_QWORD *)v4 + 15);
  if (userId)
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(userId, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_setUserId_(self, (const char *)v4, v8);
  }
  v4 = v27;
LABEL_13:
  contactInformation = self->_contactInformation;
  v10 = *((_QWORD *)v4 + 3);
  if (contactInformation)
  {
    if (!v10)
      goto LABEL_19;
    objc_msgSend_mergeFrom_(contactInformation, (const char *)v4, v10);
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    objc_msgSend_setContactInformation_(self, (const char *)v4, v10);
  }
  v4 = v27;
LABEL_19:
  v11 = *((_WORD *)v4 + 68);
  if ((v11 & 0x40) != 0)
  {
    self->_state = *((_DWORD *)v4 + 29);
    *(_WORD *)&self->_has |= 0x40u;
    v11 = *((_WORD *)v4 + 68);
    if ((v11 & 8) == 0)
    {
LABEL_21:
      if ((v11 & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_21;
  }
  self->_participantType = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 68) & 0x10) != 0)
  {
LABEL_22:
    self->_permission = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_23:
  inviterId = self->_inviterId;
  v13 = *((_QWORD *)v4 + 6);
  if (inviterId)
  {
    if (!v13)
      goto LABEL_32;
    objc_msgSend_mergeFrom_(inviterId, (const char *)v4, v13);
  }
  else
  {
    if (!v13)
      goto LABEL_32;
    objc_msgSend_setInviterId_(self, (const char *)v4, v13);
  }
  v4 = v27;
LABEL_32:
  if ((*((_WORD *)v4 + 68) & 0x100) != 0)
  {
    self->_createdInProcess = *((_BYTE *)v4 + 129);
    *(_WORD *)&self->_has |= 0x100u;
  }
  publicKey = self->_publicKey;
  v15 = *((_QWORD *)v4 + 13);
  if (publicKey)
  {
    if (!v15)
      goto LABEL_40;
    objc_msgSend_mergeFrom_(publicKey, (const char *)v4, v15);
  }
  else
  {
    if (!v15)
      goto LABEL_40;
    objc_msgSend_setPublicKey_(self, (const char *)v4, v15);
  }
  v4 = v27;
LABEL_40:
  if ((*((_WORD *)v4 + 68) & 1) != 0)
  {
    self->_acceptTimestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  protectionInfo = self->_protectionInfo;
  v17 = *((_QWORD *)v4 + 11);
  if (protectionInfo)
  {
    if (!v17)
      goto LABEL_48;
    objc_msgSend_mergeFrom_(protectionInfo, (const char *)v4, v17);
  }
  else
  {
    if (!v17)
      goto LABEL_48;
    objc_msgSend_setProtectionInfo_(self, (const char *)v4, v17);
  }
  v4 = v27;
LABEL_48:
  v18 = *((_QWORD *)v4 + 8);
  if (v18)
  {
    objc_msgSend_setOutOfNetworkPrivateKey_(self, (const char *)v4, v18);
    v4 = v27;
  }
  v19 = *((_WORD *)v4 + 68);
  if ((v19 & 4) != 0)
  {
    self->_outOfNetworkKeyType = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 4u;
    v19 = *((_WORD *)v4 + 68);
    if ((v19 & 0x20) == 0)
    {
LABEL_52:
      if ((v19 & 0x80) == 0)
        goto LABEL_53;
      goto LABEL_60;
    }
  }
  else if ((v19 & 0x20) == 0)
  {
    goto LABEL_52;
  }
  self->_publicKeyVersion = *((_DWORD *)v4 + 28);
  *(_WORD *)&self->_has |= 0x20u;
  v19 = *((_WORD *)v4 + 68);
  if ((v19 & 0x80) == 0)
  {
LABEL_53:
    if ((v19 & 0x800) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_60:
  self->_acceptedInProcess = *((_BYTE *)v4 + 128);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 68) & 0x800) != 0)
  {
LABEL_54:
    self->_isInNetwork = *((_BYTE *)v4 + 132);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_55:
  acceptedTimestampDate = self->_acceptedTimestampDate;
  v21 = *((_QWORD *)v4 + 2);
  if (acceptedTimestampDate)
  {
    if (!v21)
      goto LABEL_65;
    objc_msgSend_mergeFrom_(acceptedTimestampDate, (const char *)v4, v21);
  }
  else
  {
    if (!v21)
      goto LABEL_65;
    objc_msgSend_setAcceptedTimestampDate_(self, (const char *)v4, v21);
  }
  v4 = v27;
LABEL_65:
  if ((*((_WORD *)v4 + 68) & 0x1000) != 0)
  {
    self->_isOrgUser = *((_BYTE *)v4 + 133);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  v22 = *((_QWORD *)v4 + 12);
  if (v22)
  {
    objc_msgSend_setProtectionInfoPublicKey_(self, (const char *)v4, v22);
    v4 = v27;
  }
  if ((*((_WORD *)v4 + 68) & 2) != 0)
  {
    self->_keyHealth = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 2u;
  }
  inviteTimestampDate = self->_inviteTimestampDate;
  v24 = *((_QWORD *)v4 + 5);
  if (inviteTimestampDate)
  {
    if (!v24)
      goto LABEL_77;
    objc_msgSend_mergeFrom_(inviteTimestampDate, (const char *)v4, v24);
  }
  else
  {
    if (!v24)
      goto LABEL_77;
    objc_msgSend_setInviteTimestampDate_(self, (const char *)v4, v24);
  }
  v4 = v27;
LABEL_77:
  v25 = *((_WORD *)v4 + 68);
  if ((v25 & 0x200) != 0)
  {
    self->_isAnonymousInvitedParticipant = *((_BYTE *)v4 + 130);
    *(_WORD *)&self->_has |= 0x200u;
    v25 = *((_WORD *)v4 + 68);
  }
  if ((v25 & 0x400) != 0)
  {
    self->_isApprovedRequester = *((_BYTE *)v4 + 131);
    *(_WORD *)&self->_has |= 0x400u;
  }
  v26 = *((_QWORD *)v4 + 4);
  if (v26)
  {
    objc_msgSend_setEncryptedContactInformation_(self, (const char *)v4, v26);
    v4 = v27;
  }

}

- (CKDPIdentifier)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
  objc_storeStrong((id *)&self->_participantId, a3);
}

- (CKDPIdentifier)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (CKDPContactInformation)contactInformation
{
  return self->_contactInformation;
}

- (void)setContactInformation:(id)a3
{
  objc_storeStrong((id *)&self->_contactInformation, a3);
}

- (CKDPIdentifier)inviterId
{
  return self->_inviterId;
}

- (void)setInviterId:(id)a3
{
  objc_storeStrong((id *)&self->_inviterId, a3);
}

- (BOOL)createdInProcess
{
  return self->_createdInProcess;
}

- (CKDPProtectionInfo)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (int64_t)acceptTimestamp
{
  return self->_acceptTimestamp;
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfo, a3);
}

- (NSData)outOfNetworkPrivateKey
{
  return self->_outOfNetworkPrivateKey;
}

- (void)setOutOfNetworkPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_outOfNetworkPrivateKey, a3);
}

- (int)outOfNetworkKeyType
{
  return self->_outOfNetworkKeyType;
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (BOOL)isInNetwork
{
  return self->_isInNetwork;
}

- (CKDPDate)acceptedTimestampDate
{
  return self->_acceptedTimestampDate;
}

- (void)setAcceptedTimestampDate:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedTimestampDate, a3);
}

- (BOOL)isOrgUser
{
  return self->_isOrgUser;
}

- (NSData)protectionInfoPublicKey
{
  return self->_protectionInfoPublicKey;
}

- (void)setProtectionInfoPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfoPublicKey, a3);
}

- (CKDPDate)inviteTimestampDate
{
  return self->_inviteTimestampDate;
}

- (void)setInviteTimestampDate:(id)a3
{
  objc_storeStrong((id *)&self->_inviteTimestampDate, a3);
}

- (BOOL)isAnonymousInvitedParticipant
{
  return self->_isAnonymousInvitedParticipant;
}

- (BOOL)isApprovedRequester
{
  return self->_isApprovedRequester;
}

- (NSData)encryptedContactInformation
{
  return self->_encryptedContactInformation;
}

- (void)setEncryptedContactInformation:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedContactInformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_protectionInfoPublicKey, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
  objc_storeStrong((id *)&self->_outOfNetworkPrivateKey, 0);
  objc_storeStrong((id *)&self->_inviterId, 0);
  objc_storeStrong((id *)&self->_inviteTimestampDate, 0);
  objc_storeStrong((id *)&self->_encryptedContactInformation, 0);
  objc_storeStrong((id *)&self->_contactInformation, 0);
  objc_storeStrong((id *)&self->_acceptedTimestampDate, 0);
}

@end
