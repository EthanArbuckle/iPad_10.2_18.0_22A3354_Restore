@implementation GKRecoveryAttempter

+ (id)recoveryAttempterUsingHandler:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7
{
  _QWORD *attemptRecovery;
  uint64_t (*v12)(_QWORD *, id, unint64_t);
  id v13;

  attemptRecovery = self->_attemptRecovery;
  v12 = (uint64_t (*)(_QWORD *, id, unint64_t))attemptRecovery[2];
  v13 = a5;
  objc_msgSend(v13, a6, v12(attemptRecovery, a3, a4), a7);

}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  return (*((uint64_t (**)(void))self->_attemptRecovery + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attemptRecovery, 0);
}

@end
