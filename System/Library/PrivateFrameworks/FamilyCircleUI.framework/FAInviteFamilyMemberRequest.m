@implementation FAInviteFamilyMemberRequest

- (BOOL)isUserInitiated
{
  return 1;
}

- (id)_endpoint
{
  return (id)*MEMORY[0x24BE30998];
}

- (id)_queryString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *inviteeShortName;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *inviteeCompositeName;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;

  objc_msgSend(MEMORY[0x24BDD1690], "URLQueryAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeCharactersInString:", CFSTR("+"));
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](self->_inviteeEmail, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("inviteeEmail=%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  inviteeShortName = self->_inviteeShortName;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](inviteeShortName, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("&inviteeShortName=%@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  inviteeCompositeName = self->_inviteeCompositeName;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](inviteeCompositeName, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("&inviteeCompositeName=%@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
  }
  _FALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[FAInviteFamilyMemberRequest _queryString].cold.1();

  return v7;
}

- (NSString)inviteeEmail
{
  return self->_inviteeEmail;
}

- (void)setInviteeEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)inviteeCompositeName
{
  return self->_inviteeCompositeName;
}

- (void)setInviteeCompositeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)inviteeShortName
{
  return self->_inviteeShortName;
}

- (void)setInviteeShortName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteeShortName, 0);
  objc_storeStrong((id *)&self->_inviteeCompositeName, 0);
  objc_storeStrong((id *)&self->_inviteeEmail, 0);
}

- (void)_queryString
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_20DE41000, v0, v1, "Query string %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
