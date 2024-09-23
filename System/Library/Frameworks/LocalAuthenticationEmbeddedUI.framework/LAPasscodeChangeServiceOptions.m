@implementation LAPasscodeChangeServiceOptions

- (LAPasscodeChangeServiceOptions)init
{
  LAPasscodeChangeServiceOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LAPasscodeChangeServiceOptions;
  result = -[LAPasscodeChangeServiceOptions init](&v3, sel_init);
  if (result)
    result->_skipSuccessNotification = 1;
  return result;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[8];

  v20[6] = *MEMORY[0x24BDAC8D0];
  v18 = (void *)MEMORY[0x24BDD17C8];
  v17 = objc_opt_class();
  v19[0] = CFSTR("title");
  -[LAPasscodeChangeServiceOptions title](self, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v3;
  v20[0] = v3;
  v19[1] = CFSTR("passcodePrompt");
  -[LAPasscodeChangeServiceOptions passcodePrompt](self, "passcodePrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v6;
  v19[2] = CFSTR("calloutURL");
  -[LAPasscodeChangeServiceOptions calloutURL](self, "calloutURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[2] = v8;
  v19[3] = CFSTR("calloutReason");
  -[LAPasscodeChangeServiceOptions calloutReason](self, "calloutReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[3] = v10;
  v19[4] = CFSTR("skipSuccessNotification");
  if (-[LAPasscodeChangeServiceOptions skipSuccessNotification](self, "skipSuccessNotification"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v20[4] = v11;
  v19[5] = CFSTR("hidePasscodeRecoveryMessage");
  if (-[LAPasscodeChangeServiceOptions hidePasscodeRecoveryMessage](self, "hidePasscodeRecoveryMessage"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v20[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v17, self, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  if (!v7)

  if (!v5)
  if (!v4)

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)passcodePrompt
{
  return self->_passcodePrompt;
}

- (void)setPasscodePrompt:(id)a3
{
  objc_storeStrong((id *)&self->_passcodePrompt, a3);
}

- (LAExtractablePassword)currentPasscode
{
  return self->_currentPasscode;
}

- (void)setCurrentPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_currentPasscode, a3);
}

- (LAExtractablePassword)newPasscode
{
  return self->_newPasscode;
}

- (void)setNewPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_newPasscode, a3);
}

- (NSURL)calloutURL
{
  return self->_calloutURL;
}

- (void)setCalloutURL:(id)a3
{
  objc_storeStrong((id *)&self->_calloutURL, a3);
}

- (NSString)calloutReason
{
  return self->_calloutReason;
}

- (void)setCalloutReason:(id)a3
{
  objc_storeStrong((id *)&self->_calloutReason, a3);
}

- (BOOL)skipSuccessNotification
{
  return self->_skipSuccessNotification;
}

- (void)setSkipSuccessNotification:(BOOL)a3
{
  self->_skipSuccessNotification = a3;
}

- (BOOL)hidePasscodeRecoveryMessage
{
  return self->_hidePasscodeRecoveryMessage;
}

- (void)setHidePasscodeRecoveryMessage:(BOOL)a3
{
  self->_hidePasscodeRecoveryMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutReason, 0);
  objc_storeStrong((id *)&self->_calloutURL, 0);
  objc_storeStrong((id *)&self->_newPasscode, 0);
  objc_storeStrong((id *)&self->_currentPasscode, 0);
  objc_storeStrong((id *)&self->_passcodePrompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
