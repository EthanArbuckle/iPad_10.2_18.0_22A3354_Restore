@implementation CNiOSABEKParticipantMatchingSearchOperationDelegate

- (BOOL)predicateShouldContinue:(id)a3
{
  return 1;
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4
{
  void (**v5)(_QWORD, _QWORD);

  if (a4)
  {
    -[CNiOSABEKParticipantMatchingSearchOperationDelegate completionHandler](self, "completionHandler", a3);
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, a4);

  }
  return a4 == 0;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
