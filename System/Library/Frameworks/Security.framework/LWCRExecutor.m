@implementation LWCRExecutor

void __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v5;
  void *v6;
  char *v7;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2, a3, 4);
  objc_msgSend(v5, "valueForKey:", v6);
  v7 = (char *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_OWORD *)a4 = *(_OWORD *)(v7 + 8);
    *(_QWORD *)(a4 + 16) = *((_QWORD *)v7 + 3);
  }
  else
  {
    *(_DWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }

}

void __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v5;
  void *v6;
  __int128 v7;
  char *v8;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2, a3, 4);
  objc_msgSend(v5, "valueForKey:", v6);
  v8 = (char *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v7 = *(_OWORD *)(v8 + 24);
    *(_OWORD *)a4 = *(_OWORD *)(v8 + 8);
    *(_OWORD *)(a4 + 16) = v7;
    *(_QWORD *)(a4 + 32) = *((_QWORD *)v8 + 5);
  }
  else
  {
    *(_DWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }

}

BOOL __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2, a3, 4);
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

@end
