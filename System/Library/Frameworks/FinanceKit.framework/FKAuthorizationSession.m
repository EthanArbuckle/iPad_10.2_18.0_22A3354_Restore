@implementation FKAuthorizationSession

- (FKAuthorizationSession)initWithSessionId:(id)a3 consent:(id)a4 codeVerifier:(id)a5 previousConsentUUID:(id)a6 institution:(id)a7 fpanId:(id)a8 authorizationType:(signed __int16)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FKAuthorizationSession *v21;
  uint64_t v22;
  NSUUID *sessionId;
  uint64_t v24;
  FKAuthorizationConsent *consent;
  uint64_t v26;
  NSString *codeVerifier;
  uint64_t v28;
  NSUUID *previousConsentUUID;
  uint64_t v30;
  FKInstitution *institution;
  uint64_t v32;
  NSString *fpanId;
  objc_super v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v35.receiver = self;
  v35.super_class = (Class)FKAuthorizationSession;
  v21 = -[FKAuthorizationSession init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    sessionId = v21->_sessionId;
    v21->_sessionId = (NSUUID *)v22;

    v24 = objc_msgSend(v16, "copy");
    consent = v21->_consent;
    v21->_consent = (FKAuthorizationConsent *)v24;

    v26 = objc_msgSend(v17, "copy");
    codeVerifier = v21->_codeVerifier;
    v21->_codeVerifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    previousConsentUUID = v21->_previousConsentUUID;
    v21->_previousConsentUUID = (NSUUID *)v28;

    v30 = objc_msgSend(v19, "copy");
    institution = v21->_institution;
    v21->_institution = (FKInstitution *)v30;

    v32 = objc_msgSend(v20, "copy");
    fpanId = v21->_fpanId;
    v21->_fpanId = (NSString *)v32;

    v21->_authorizationType = a9;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKAuthorizationSession *v5;
  uint64_t v6;
  NSUUID *sessionId;
  FKAuthorizationConsent *v8;
  FKAuthorizationConsent *consent;
  uint64_t v10;
  NSString *codeVerifier;
  uint64_t v12;
  NSUUID *previousConsentUUID;
  FKInstitution *v14;
  FKInstitution *institution;
  uint64_t v16;
  NSString *fpanId;

  v5 = objc_alloc_init(FKAuthorizationSession);
  v6 = -[NSUUID copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  sessionId = v5->_sessionId;
  v5->_sessionId = (NSUUID *)v6;

  v8 = -[FKAuthorizationConsent copyWithZone:](self->_consent, "copyWithZone:", a3);
  consent = v5->_consent;
  v5->_consent = v8;

  v10 = -[NSString copyWithZone:](self->_codeVerifier, "copyWithZone:", a3);
  codeVerifier = v5->_codeVerifier;
  v5->_codeVerifier = (NSString *)v10;

  v12 = -[NSUUID copyWithZone:](self->_previousConsentUUID, "copyWithZone:", a3);
  previousConsentUUID = v5->_previousConsentUUID;
  v5->_previousConsentUUID = (NSUUID *)v12;

  v14 = -[FKInstitution copyWithZone:](self->_institution, "copyWithZone:", a3);
  institution = v5->_institution;
  v5->_institution = v14;

  v16 = -[NSString copyWithZone:](self->_fpanId, "copyWithZone:", a3);
  fpanId = v5->_fpanId;
  v5->_fpanId = (NSString *)v16;

  v5->_authorizationType = self->_authorizationType;
  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_sessionId);
  objc_msgSend(v3, "safelyAddObject:", self->_consent);
  objc_msgSend(v3, "safelyAddObject:", self->_codeVerifier);
  objc_msgSend(v3, "safelyAddObject:", self->_previousConsentUUID);
  objc_msgSend(v3, "safelyAddObject:", self->_institution);
  objc_msgSend(v3, "safelyAddObject:", self->_fpanId);
  v4 = FKCombinedHash(17, v3);
  v5 = FKIntegerHash(v4, self->_authorizationType);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FKAuthorizationSession *v4;
  FKAuthorizationSession *v5;
  void **v6;
  BOOL v7;

  v4 = (FKAuthorizationSession *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = FKEqualObjects(self->_sessionId, v6[2])
      && FKEqualObjects(self->_consent, v6[3])
      && FKEqualObjects(self->_codeVerifier, v6[4])
      && FKEqualObjects(self->_previousConsentUUID, v6[5])
      && FKEqualObjects(self->_institution, v6[6])
      && FKEqualObjects(self->_fpanId, v6[7])
      && (unsigned __int16)self->_authorizationType == *((unsigned __int16 *)v6 + 4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (FKAuthorizationConsent)consent
{
  return self->_consent;
}

- (NSString)codeVerifier
{
  return self->_codeVerifier;
}

- (NSUUID)previousConsentUUID
{
  return self->_previousConsentUUID;
}

- (FKInstitution)institution
{
  return self->_institution;
}

- (NSString)fpanId
{
  return self->_fpanId;
}

- (signed)authorizationType
{
  return self->_authorizationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpanId, 0);
  objc_storeStrong((id *)&self->_institution, 0);
  objc_storeStrong((id *)&self->_previousConsentUUID, 0);
  objc_storeStrong((id *)&self->_codeVerifier, 0);
  objc_storeStrong((id *)&self->_consent, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end
