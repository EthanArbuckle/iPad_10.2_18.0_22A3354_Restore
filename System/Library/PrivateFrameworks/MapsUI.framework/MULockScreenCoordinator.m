@implementation MULockScreenCoordinator

- (MULockScreenCoordinator)initWithPasscodeProvider:(id)a3
{
  id v4;
  MULockScreenCoordinator *v5;
  uint64_t v6;
  id passcodeProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MULockScreenCoordinator;
  v5 = -[MULockScreenCoordinator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    passcodeProvider = v5->_passcodeProvider;
    v5->_passcodeProvider = (id)v6;

  }
  return v5;
}

- (void)performActionIfSuccessfullyAuthenticated:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__MULockScreenCoordinator_performActionIfSuccessfullyAuthenticated___block_invoke;
    v5[3] = &unk_1E2E02EE8;
    v6 = v4;
    objc_copyWeak(&v7, &location);
    +[MapsUIUtilities checkDeviceLockStatusWithCompletion:](MapsUIUtilities, "checkDeviceLockStatusWithCompletion:", v5);
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }

}

void __68__MULockScreenCoordinator_performActionIfSuccessfullyAuthenticated___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v5 = *((_QWORD *)WeakRetained + 1);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __68__MULockScreenCoordinator_performActionIfSuccessfullyAuthenticated___block_invoke_2;
      v6[3] = &unk_1E2E02EC0;
      v7 = *(id *)(a1 + 32);
      (*(void (**)(uint64_t, _QWORD *))(v5 + 16))(v5, v6);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __68__MULockScreenCoordinator_performActionIfSuccessfullyAuthenticated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeProvider, 0);
}

@end
