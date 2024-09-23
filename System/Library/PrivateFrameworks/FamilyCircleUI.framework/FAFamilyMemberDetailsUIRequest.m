@implementation FAFamilyMemberDetailsUIRequest

- (BOOL)isUserInitiated
{
  return 1;
}

- (id)_endpoint
{
  return (id)*MEMORY[0x24BE309C0];
}

- (id)_queryString
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[8];
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD1808]);
  if (self->_memberEmail)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("invitedEmail"), self->_memberEmail);
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setQueryItems:", v5);
LABEL_5:

    goto LABEL_6;
  }
  if (self->_memberDSID)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), -[NSNumber unsignedLongLongValue](self->_memberDSID, "unsignedLongLongValue"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("memberId"), v4);
    v12 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setQueryItems:", v7);

    goto LABEL_5;
  }
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "Error: no member DSID or email. This will go badly.", buf, 2u);
  }
LABEL_6:

  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FAFamilyMemberDetailsUIRequest _queryString].cold.1(v3, v8);

  objc_msgSend(v3, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)URLRequestWithCompletion:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __59__FAFamilyMemberDetailsUIRequest_URLRequestWithCompletion___block_invoke;
  v6[3] = &unk_24C88D770;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)FAFamilyMemberDetailsUIRequest;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[FAFamilyRequest URLRequestWithCompletion:](&v5, sel_URLRequestWithCompletion_, v6);

}

void __59__FAFamilyMemberDetailsUIRequest_URLRequestWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = (id)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE30AE0], "addMessageEligibilityToPayload:", v4);
    objc_msgSend(v7, "aa_setBodyWithParameters:", v4);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)objc_msgSend(v7, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
}

- (NSNumber)memberDSID
{
  return self->_memberDSID;
}

- (void)setMemberDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)memberEmail
{
  return self->_memberEmail;
}

- (void)setMemberEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberEmail, 0);
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

- (void)_queryString
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_20DE41000, a2, v4, "Query string %@", v5);

}

@end
