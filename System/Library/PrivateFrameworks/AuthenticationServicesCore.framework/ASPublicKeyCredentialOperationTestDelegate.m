@implementation ASPublicKeyCredentialOperationTestDelegate

- (void)didCompleteRegistrationWithCredential:(id)a3 error:(id)a4
{
  void (**didCompletionRegistrationCallback)(id, id, id);

  didCompletionRegistrationCallback = (void (**)(id, id, id))self->_didCompletionRegistrationCallback;
  if (didCompletionRegistrationCallback)
  {
    didCompletionRegistrationCallback[2](didCompletionRegistrationCallback, a3, a4);
    didCompletionRegistrationCallback = (void (**)(id, id, id))self->_didCompletionRegistrationCallback;
  }
  self->_didCompletionRegistrationCallback = 0;

}

- (BOOL)isCABLEAuthenticatorRequest
{
  return 0;
}

- (id)didCompletionRegistrationCallback
{
  return self->_didCompletionRegistrationCallback;
}

- (void)setDidCompletionRegistrationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didCompletionRegistrationCallback, 0);
}

@end
