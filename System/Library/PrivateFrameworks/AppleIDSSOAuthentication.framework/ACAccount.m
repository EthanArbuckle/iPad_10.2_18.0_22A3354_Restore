@implementation ACAccount

void __75__ACAccount_AppleIDAuthentication__aida_tokenForService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = a3;
    objc_msgSend(a2, "objectForKeyedSubscript:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);

  }
}

void __85__ACAccount_AppleIDAuthentication___performSilentReauthForAccount_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0CFFF70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);

}

@end
