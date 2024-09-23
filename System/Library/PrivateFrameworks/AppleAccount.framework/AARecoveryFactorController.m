@implementation AARecoveryFactorController

- (void)availableRecoveryFactorsWithCompletion:(id)a3
{
  id v3;
  AACustodianController *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(AACustodianController);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__AARecoveryFactorController_availableRecoveryFactorsWithCompletion___block_invoke;
  v6[3] = &unk_1E416E568;
  v7 = v3;
  v5 = v3;
  -[AACustodianController availableRecoveryFactorsWithCompletion:](v4, "availableRecoveryFactorsWithCompletion:", v6);

}

uint64_t __69__AARecoveryFactorController_availableRecoveryFactorsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
