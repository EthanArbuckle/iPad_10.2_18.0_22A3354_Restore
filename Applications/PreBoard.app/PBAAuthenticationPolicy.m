@implementation PBAAuthenticationPolicy

- (BOOL)allowAuthenticationRevocation
{
  return 1;
}

- (BOOL)shouldClearBlockStateOnSync
{
  return 0;
}

- (BOOL)usesSecureMode
{
  return 0;
}

- (void)wipeDeviceWithReason:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SBFObliterationController sharedInstance](SBFObliterationController, "sharedInstance"));
  objc_msgSend(v4, "obliterateDataPartitionShowingProgress:skipDataObliteration:eraseDataPlan:reason:", 0, 0, 0, v3);

}

- (void)passcodeAuthenticationFailedWithError:(id)a3
{
  void *v4;
  unsigned int v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", SBFMKBErrorDomain);

  if (v5 && objc_msgSend(v7, "code") == (id)-14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "authenticationPolicyEncounteredPolicyError:", self);

  }
}

- (PBAAuthenticationPolicyDelegate)delegate
{
  return (PBAAuthenticationPolicyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
