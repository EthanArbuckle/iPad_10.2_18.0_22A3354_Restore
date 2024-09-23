@implementation AAUIAccountRecoveryManagementContext

- (id)description
{
  _BOOL4 recoveryKeyEligible;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  NSString *recoveryKeyHTTPMethod;
  NSURL *icloudDataRecoveryDetailsURL;
  NSString *icloudDataRecoveryDetailsHTTPMethod;
  NSURL *icloudDataRecoveryReAddURL;
  void *v10;
  void *v11;
  _QWORD v13[11];
  _QWORD v14[8];
  __int128 v15;
  NSURL *learnMoreURL;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  recoveryKeyEligible = self->_recoveryKeyEligible;
  v13[0] = CFSTR("recoveryKeyEligible");
  v13[1] = CFSTR("recoveryKeyIsOn");
  v3 = CFSTR("YES");
  if (recoveryKeyEligible)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->_recoveryKeyIsOn)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v14[0] = v4;
  v14[1] = v5;
  v13[2] = CFSTR("recoveryKeyURL");
  v13[3] = CFSTR("recoveryKeyHTTPMethod");
  recoveryKeyHTTPMethod = self->_recoveryKeyHTTPMethod;
  v14[2] = self->_recoveryKeyURL;
  v14[3] = recoveryKeyHTTPMethod;
  if (!self->_icloudDataRecoveryShouldShowRow)
    v3 = CFSTR("NO");
  v13[4] = CFSTR("icloudDataRecoveryShouldShowRow");
  v13[5] = CFSTR("icloudDataRecoveryDetailsURL");
  icloudDataRecoveryDetailsURL = self->_icloudDataRecoveryDetailsURL;
  icloudDataRecoveryDetailsHTTPMethod = self->_icloudDataRecoveryDetailsHTTPMethod;
  v14[4] = v3;
  v14[5] = icloudDataRecoveryDetailsURL;
  v13[6] = CFSTR("icloudDataRecoveryDetailsHTTPMethod");
  v13[7] = CFSTR("icloudDataRecoveryReAddURL");
  icloudDataRecoveryReAddURL = self->_icloudDataRecoveryReAddURL;
  v14[6] = icloudDataRecoveryDetailsHTTPMethod;
  v14[7] = icloudDataRecoveryReAddURL;
  v15 = *(_OWORD *)&self->_icloudDataRecoveryReAddHTTPMethod;
  v13[8] = CFSTR("icloudDataRecoveryReAddHTTPMethod");
  v13[9] = CFSTR("icloudDataRecoveryRowLabel");
  v13[10] = CFSTR("learnMoreURL");
  learnMoreURL = self->_learnMoreURL;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)recoveryKeyEligible
{
  return self->_recoveryKeyEligible;
}

- (void)setRecoveryKeyEligible:(BOOL)a3
{
  self->_recoveryKeyEligible = a3;
}

- (BOOL)recoveryKeyIsOn
{
  return self->_recoveryKeyIsOn;
}

- (void)setRecoveryKeyIsOn:(BOOL)a3
{
  self->_recoveryKeyIsOn = a3;
}

- (NSURL)recoveryKeyURL
{
  return self->_recoveryKeyURL;
}

- (void)setRecoveryKeyURL:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryKeyURL, a3);
}

- (NSString)recoveryKeyHTTPMethod
{
  return self->_recoveryKeyHTTPMethod;
}

- (void)setRecoveryKeyHTTPMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)icloudDataRecoveryShouldShowRow
{
  return self->_icloudDataRecoveryShouldShowRow;
}

- (void)setIcloudDataRecoveryShouldShowRow:(BOOL)a3
{
  self->_icloudDataRecoveryShouldShowRow = a3;
}

- (NSURL)icloudDataRecoveryDetailsURL
{
  return self->_icloudDataRecoveryDetailsURL;
}

- (void)setIcloudDataRecoveryDetailsURL:(id)a3
{
  objc_storeStrong((id *)&self->_icloudDataRecoveryDetailsURL, a3);
}

- (NSString)icloudDataRecoveryDetailsHTTPMethod
{
  return self->_icloudDataRecoveryDetailsHTTPMethod;
}

- (void)setIcloudDataRecoveryDetailsHTTPMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)icloudDataRecoveryReAddURL
{
  return self->_icloudDataRecoveryReAddURL;
}

- (void)setIcloudDataRecoveryReAddURL:(id)a3
{
  objc_storeStrong((id *)&self->_icloudDataRecoveryReAddURL, a3);
}

- (NSString)icloudDataRecoveryReAddHTTPMethod
{
  return self->_icloudDataRecoveryReAddHTTPMethod;
}

- (void)setIcloudDataRecoveryReAddHTTPMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)icloudDataRecoveryRowLabel
{
  return self->_icloudDataRecoveryRowLabel;
}

- (void)setIcloudDataRecoveryRowLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryRowLabel, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryReAddHTTPMethod, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryReAddURL, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryDetailsHTTPMethod, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryDetailsURL, 0);
  objc_storeStrong((id *)&self->_recoveryKeyHTTPMethod, 0);
  objc_storeStrong((id *)&self->_recoveryKeyURL, 0);
}

@end
