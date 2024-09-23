@implementation FBKSUserLoginInfo

- (FBKSUserLoginInfo)initWithDictionary:(id)a3
{
  id v4;
  FBKSUserLoginInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *username;
  void *v9;
  uint64_t v10;
  NSNumber *participantID;
  void *v12;
  uint64_t v13;
  NSString *givenName;
  void *v15;
  uint64_t v16;
  NSString *familyName;
  void *v18;
  uint64_t v19;
  NSString *deviceToken;
  void *v21;
  void *v22;
  FBKSCustomBehavior *v23;
  FBKSCustomBehavior *behavior;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  FBKSPendingConsent *v34;
  uint64_t v35;
  NSArray *pendingConsents;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FBKSUserLoginInfo;
  v5 = -[FBKSUserLoginInfo init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("default_email"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("participant_id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    participantID = v5->_participantID;
    v5->_participantID = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("first_name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("last_name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v15);
    v16 = objc_claimAutoreleasedReturnValue();
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v18);
    v19 = objc_claimAutoreleasedReturnValue();
    deviceToken = v5->_deviceToken;
    v5->_deviceToken = (NSString *)v19;

    v5->_isSystemAccount = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("behavior"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = -[FBKSCustomBehavior initWithDictionary:]([FBKSCustomBehavior alloc], "initWithDictionary:", v22);
        behavior = v5->_behavior;
        v5->_behavior = v23;

      }
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pending_consents"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = v27;
        v39 = v22;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v28 = v27;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v41 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v34 = -[FBKSPendingConsent initWithDictionary:]([FBKSPendingConsent alloc], "initWithDictionary:", v33);
                if (-[FBKSPendingConsent type](v34, "type"))
                  objc_msgSend(v25, "addObject:", v34);

              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          }
          while (v30);
        }

        v27 = v38;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v25, v38, v39, (_QWORD)v40);
    v35 = objc_claimAutoreleasedReturnValue();
    pendingConsents = v5->_pendingConsents;
    v5->_pendingConsents = (NSArray *)v35;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FBKSUserLoginInfo deviceToken](self, "deviceToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSUserLoginInfo participantID](self, "participantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSUserLoginInfo username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSUserLoginInfo givenName](self, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSUserLoginInfo familyName](self, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("LoginInfo: deviceToken: %@, participantID: %@, username: %@, givenName: %@, familyName: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)saveDeviceTokenLookupInformation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[FBKSSharedConstants sharedUserDefaults](FBKSSharedConstants, "sharedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSUserLoginInfo username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("LastSuccessfulLogin"));

  +[FBKSSharedConstants sharedUserDefaults](FBKSSharedConstants, "sharedUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSUserLoginInfo participantID](self, "participantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("LastSuccessfulID"));

}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (void)setDeviceToken:(id)a3
{
  objc_storeStrong((id *)&self->_deviceToken, a3);
}

- (NSNumber)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_storeStrong((id *)&self->_participantID, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_givenName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (FBKSCustomBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_behavior, a3);
}

- (NSArray)pendingConsents
{
  return self->_pendingConsents;
}

- (void)setPendingConsents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConsents, a3);
}

- (BOOL)isAppleConnectLogin
{
  return self->_isAppleConnectLogin;
}

- (void)setIsAppleConnectLogin:(BOOL)a3
{
  self->_isAppleConnectLogin = a3;
}

- (BOOL)isSystemAccount
{
  return self->_isSystemAccount;
}

- (void)setIsSystemAccount:(BOOL)a3
{
  self->_isSystemAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConsents, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
}

@end
