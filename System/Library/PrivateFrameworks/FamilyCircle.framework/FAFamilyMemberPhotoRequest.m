@implementation FAFamilyMemberPhotoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (FAFamilyMemberPhotoRequest)initWithMemberDSID:(id)a3 accountStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FAFamilyMemberPhotoRequest *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)FAFamilyMemberPhotoRequest;
  v9 = -[AAFamilyRequest initWithAppleAccount:grandSlamAccount:accountStore:](&v11, sel_initWithAppleAccount_grandSlamAccount_accountStore_, v8, 0, v7);

  if (v9)
    -[FAFamilyMemberPhotoRequest setFamilyMemberDSID:](v9, "setFamilyMemberDSID:", v6);

  return v9;
}

- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 accountStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FAFamilyMemberPhotoRequest *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)FAFamilyMemberPhotoRequest;
  v9 = -[AAFamilyRequest initWithAppleAccount:grandSlamAccount:accountStore:](&v11, sel_initWithAppleAccount_grandSlamAccount_accountStore_, v8, 0, v7);

  if (v9)
    -[FAFamilyMemberPhotoRequest setFamilyMemberAltDSID:](v9, "setFamilyMemberAltDSID:", v6);

  return v9;
}

- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 ephemeralAuthResults:(id)a4
{
  id v6;
  id v7;
  FARequestEphemeralSigner *v8;
  FAFamilyMemberPhotoRequest *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[FARequestEphemeralSigner initWithEphemeralAuthResults:]([FARequestEphemeralSigner alloc], "initWithEphemeralAuthResults:", v6);

  v9 = -[FAFamilyMemberPhotoRequest initWithMemberAltDSID:ephemeralAuthSigner:](self, "initWithMemberAltDSID:ephemeralAuthSigner:", v7, v8);
  return v9;
}

- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 ephemeralAuthSigner:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FAFamilyMemberPhotoRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)FAFamilyMemberPhotoRequest;
  v10 = -[AAFamilyRequest initWithAppleAccount:grandSlamAccount:accountStore:](&v12, sel_initWithAppleAccount_grandSlamAccount_accountStore_, v9, 0, 0);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_ephemeralAuthSigner, a4);
    objc_storeStrong((id *)&v10->_familyMemberAltDSID, a3);
  }

  return v10;
}

- (id)fa_photoRequestBaseURLString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CFAD58], "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getFamilyMemberPhotoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlString
{
  void *v3;
  NSNumber *familyMemberDSID;
  NSString *familyMemberAltDSID;
  void *v6;
  NSObject *v8;

  -[FAFamilyMemberPhotoRequest fa_photoRequestBaseURLString](self, "fa_photoRequestBaseURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  familyMemberDSID = self->_familyMemberDSID;
  if (familyMemberDSID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?memberId=%@"), v3, familyMemberDSID);
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  familyMemberAltDSID = self->_familyMemberAltDSID;
  if (familyMemberAltDSID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?memberAltDSID=%@"), v3, familyMemberAltDSID);
    goto LABEL_5;
  }
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[FAFamilyMemberPhotoRequest urlString].cold.1(v8);

  v6 = 0;
LABEL_6:

  return v6;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSString *serverCacheTag;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FAFamilyMemberPhotoRequest;
  -[AAFamilyRequest urlRequest](&v11, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v4, "fam_addiTunesHeadersWithAccount:", self->_iTunesAccount);
  serverCacheTag = self->_serverCacheTag;
  if (serverCacheTag)
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", serverCacheTag, CFSTR("ETag"));
  -[FAFamilyMemberPhotoRequest ephemeralAuthSigner](self, "ephemeralAuthSigner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FAFamilyMemberPhotoRequest ephemeralAuthSigner](self, "ephemeralAuthSigner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signURLRequest:", v4);

    -[FAFamilyMemberPhotoRequest ephemeralAuthSigner](self, "ephemeralAuthSigner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v9, 1);

  }
  return v4;
}

- (NSNumber)familyMemberDSID
{
  return self->_familyMemberDSID;
}

- (void)setFamilyMemberDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)familyMemberAltDSID
{
  return self->_familyMemberAltDSID;
}

- (void)setFamilyMemberAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setiTunesAccount:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesAccount, a3);
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (void)setServerCacheTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (_TtP12FamilyCircle15FARequestSigner_)ephemeralAuthSigner
{
  return self->_ephemeralAuthSigner;
}

- (void)setEphemeralAuthSigner:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralAuthSigner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralAuthSigner, 0);
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_familyMemberAltDSID, 0);
  objc_storeStrong((id *)&self->_familyMemberDSID, 0);
}

- (void)urlString
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_ERROR, "FAFamilyMemberPhotoRequest has no memberDSID or memberAltDSID", v1, 2u);
}

@end
