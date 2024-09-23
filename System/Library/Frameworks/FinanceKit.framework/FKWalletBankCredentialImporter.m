@implementation FKWalletBankCredentialImporter

- (FKWalletBankCredentialImporter)init
{
  FKWalletBankCredentialImporter *v2;
  uint64_t v3;
  _FKWalletBankCredentialImporter *wrappedImporter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKWalletBankCredentialImporter;
  v2 = -[FKWalletBankCredentialImporter init](&v6, sel_init);
  if (v2)
  {
    +[_FKWalletBankCredentialImporter makeImporter](_FKWalletBankCredentialImporter, "makeImporter");
    v3 = objc_claimAutoreleasedReturnValue();
    wrappedImporter = v2->_wrappedImporter;
    v2->_wrappedImporter = (_FKWalletBankCredentialImporter *)v3;

  }
  return v2;
}

- (void)insertBankCredentialFromBankInformation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;

  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__FKWalletBankCredentialImporter_insertBankCredentialFromBankInformation_completion___block_invoke;
  aBlock[3] = &unk_250466DA8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  -[_FKWalletBankCredentialImporter insertCredentialFrom:completionHandler:](self->_wrappedImporter, "insertCredentialFrom:completionHandler:", v8, v9);

}

uint64_t __85__FKWalletBankCredentialImporter_insertBankCredentialFromBankInformation_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (_FKWalletBankCredentialImporter)wrappedImporter
{
  return self->_wrappedImporter;
}

- (void)setWrappedImporter:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedImporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedImporter, 0);
}

@end
