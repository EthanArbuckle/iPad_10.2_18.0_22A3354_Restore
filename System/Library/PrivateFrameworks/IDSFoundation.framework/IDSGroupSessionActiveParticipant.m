@implementation IDSGroupSessionActiveParticipant

- (IDSGroupSessionActiveParticipant)initWithGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4 isKnown:(BOOL)a5 participantURI:(id)a6 pushToken:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  const char *v15;
  char isKindOfClass;
  double v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  uint64_t isKnown_participantURIObject_pushTokenObject;
  IDSGroupSessionActiveParticipant *v23;

  v9 = a5;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {

    v14 = 0;
  }
  if (v13)
  {
    objc_msgSend_URIWithPrefixedURI_(IDSURI, v15, (uint64_t)v13, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
LABEL_5:
      objc_msgSend_pushTokenWithData_(IDSPushToken, v15, (uint64_t)v14, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      isKnown_participantURIObject_pushTokenObject = objc_msgSend_initWithGroupUUID_participantIdentifier_isKnown_participantURIObject_pushTokenObject_(self, v20, (uint64_t)v12, v21, a4, v9, v18, v19);
      goto LABEL_8;
    }
  }
  else
  {
    v18 = 0;
    if (v14)
      goto LABEL_5;
  }
  v19 = 0;
  isKnown_participantURIObject_pushTokenObject = objc_msgSend_initWithGroupUUID_participantIdentifier_isKnown_participantURIObject_pushTokenObject_(self, v15, (uint64_t)v12, v17, a4, v9, v18, 0);
LABEL_8:
  v23 = (IDSGroupSessionActiveParticipant *)isKnown_participantURIObject_pushTokenObject;
  if (v14)

  if (v13)
  if (v23)
    v23->_givenNSNullToken = isKindOfClass & 1;

  return v23;
}

- (IDSGroupSessionActiveParticipant)initWithGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4 isKnown:(BOOL)a5 participantURIObject:(id)a6 pushTokenObject:(id)a7
{
  id v13;
  id v14;
  id v15;
  IDSGroupSessionActiveParticipant *v16;
  IDSGroupSessionActiveParticipant *v17;
  objc_super v19;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)IDSGroupSessionActiveParticipant;
  v16 = -[IDSGroupSessionActiveParticipant init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_groupUUID, a3);
    v17->_participantIdentifier = a4;
    objc_storeStrong((id *)&v17->_participantURIObject, a6);
    v17->_isKnown = a5;
    objc_storeStrong((id *)&v17->_participantPushTokenObject, a7);
  }

  return v17;
}

- (IDSGroupSessionActiveParticipant)initWithDictionaryRepresentation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  IDSGroupSessionActiveParticipant *isKnown_participantURI_pushToken;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend_objectForKeyedSubscript_(v5, v7, (uint64_t)CFSTR("IDSGroupSessionActiveParticipantGroupUUIDKey"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithUUIDString_(v6, v10, (uint64_t)v9, v11);
  objc_msgSend_objectForKeyedSubscript_(v5, v13, (uint64_t)CFSTR("IDSGroupSessionActiveParticipantIdentifierKey"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_unsignedLongLongValue(v15, v16, v17, v18);
  objc_msgSend_objectForKeyedSubscript_(v5, v20, (uint64_t)CFSTR("IDSGroupSessionActiveParticipantIdentifierKey"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);
  objc_msgSend_objectForKeyedSubscript_(v5, v27, (uint64_t)CFSTR("IDSGroupSessionActiveParticipantURIKey"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v30, (uint64_t)CFSTR("IDSGroupSessionActiveParticipantPushTokenKey"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  isKnown_participantURI_pushToken = (IDSGroupSessionActiveParticipant *)objc_msgSend_initWithGroupUUID_participantIdentifier_isKnown_participantURI_pushToken_(self, v33, (uint64_t)v12, v34, v19, v26, v29, v32);
  return isKnown_participantURI_pushToken;
}

- (id)dictionaryRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t isKnown;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_groupUUID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, v13, CFSTR("IDSGroupSessionActiveParticipantGroupUUIDKey"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend_participantIdentifier(self, v15, v16, v17);
  objc_msgSend_numberWithUnsignedLongLong_(v14, v19, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, v23, CFSTR("IDSGroupSessionActiveParticipantIdentifierKey"));

  objc_msgSend_participantURI(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, v29, CFSTR("IDSGroupSessionActiveParticipantURIKey"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  isKnown = objc_msgSend_isKnown(self, v31, v32, v33);
  objc_msgSend_numberWithBool_(v30, v35, isKnown, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, v39, CFSTR("IDSGroupSessionActiveParticipantIsKnown"));

  objc_msgSend_participantPushToken(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)v43, v45, CFSTR("IDSGroupSessionActiveParticipantPushTokenKey"));

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  IDSURI *participantURIObject;
  IDSPushToken *participantPushTokenObject;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_groupUUID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_participantIdentifier(self, v9, v10, v11);
  participantURIObject = self->_participantURIObject;
  participantPushTokenObject = self->_participantPushTokenObject;
  if (objc_msgSend_isKnown(self, v15, v16, v17))
    objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)CFSTR("<%@: %p groupUUID: %@, participantIdentifier: %llu, participantURI: %@, participantPushToken: %@, isKnown: %@>"), v19, v4, self, v8, v12, participantURIObject, participantPushTokenObject, CFSTR("YES"));
  else
    objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)CFSTR("<%@: %p groupUUID: %@, participantIdentifier: %llu, participantURI: %@, participantPushToken: %@, isKnown: %@>"), v19, v4, self, v8, v12, participantURIObject, participantPushTokenObject, CFSTR("NO"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  double v25;
  void *v26;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_groupUUID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_participantIdentifier(self, v9, v10, v11);
  objc_msgSend_debugDescription(self->_participantURIObject, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(self->_participantPushTokenObject, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isKnown(self, v21, v22, v23))
    objc_msgSend_stringWithFormat_(v3, v24, (uint64_t)CFSTR("%@: %p {\n\tgroupUUID: %@\n\tparticipantIdentifier: %lu\n\tparticipantURI: %@\n\tparticipantPushToken: %@\n\tisKnown: %@}"), v25, v4, self, v8, v12, v16, v20, CFSTR("YES"));
  else
    objc_msgSend_stringWithFormat_(v3, v24, (uint64_t)CFSTR("%@: %p {\n\tgroupUUID: %@\n\tparticipantIdentifier: %lu\n\tparticipantURI: %@\n\tparticipantPushToken: %@\n\tisKnown: %@}"), v25, v4, self, v8, v12, v16, v20, CFSTR("NO"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (IDSPushToken)participantPushTokenObject
{
  uint64_t v2;
  double v3;
  IDSPushToken *v4;

  if (self->_givenNSNullToken)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], a2, v2, v3);
    v4 = (IDSPushToken *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_participantPushTokenObject;
  }
  return v4;
}

- (NSString)participantURI
{
  uint64_t v2;
  double v3;

  return (NSString *)objc_msgSend_prefixedURI(self->_participantURIObject, a2, v2, v3);
}

- (NSData)participantPushToken
{
  uint64_t v2;
  double v3;

  if (self->_givenNSNullToken)
    objc_msgSend_null(MEMORY[0x1E0C99E38], a2, v2, v3);
  else
    objc_msgSend_rawToken(self->_participantPushTokenObject, a2, v2, v3);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (BOOL)isKnown
{
  return self->_isKnown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantPushTokenObject, 0);
  objc_storeStrong((id *)&self->_participantURIObject, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
}

@end
