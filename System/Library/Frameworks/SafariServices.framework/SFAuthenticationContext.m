@implementation SFAuthenticationContext

void __32___SFAuthenticationContext_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateAuthentication");

}

void __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _BYTE *v6;
  uint64_t v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  timespec v12;

  v5 = a3;
  if (a2)
  {
    v6 = *(_BYTE **)(a1 + 32);
    if (v6[81])
    {
      a2 = 0;
    }
    else
    {
      if (objc_msgSend(v6, "_contextRequiresSessionBasedAuthentication"))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
      a2 = 1;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

  if (a2)
  {
    v12.tv_sec = 0;
    v12.tv_nsec = 0;
    clock_gettime(_CLOCK_MONOTONIC, &v12);
    v9 = (double)v12.tv_nsec / 1000000000.0 + (double)v12.tv_sec;
  }
  else
  {
    v9 = 1.79769313e308;
  }
  *(double *)(*(_QWORD *)(a1 + 32) + 56) = v9;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 81))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobilesafari.authenticationContextErrorDomain"), 1, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_processNextClientAwaitingAuthenticationUserInitiated:", *(unsigned __int8 *)(a1 + 56));

}

void __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke_2;
  block[3] = &unk_1E4AC5960;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_2;
  v7[3] = &unk_1E4AC59B0;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v2 == 0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  int v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_2_51;
  v12[3] = &unk_1E4AC5A00;
  v14 = *(id *)(a1 + 40);
  v15 = v6 == 0;
  v7 = v6;
  v13 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x1A8598C40](v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "authenticationCustomUIProgressObserverForContext:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 82))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E4B25EA0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11 && !v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "authenticationDidEncounterMatch:completion:", *(_QWORD *)(a1 + 32), v8);
      goto LABEL_10;
    }
LABEL_9:
    v8[2](v8);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_9;
  objc_msgSend(v9, "authenticationDidCancel:completion:", *(_QWORD *)(a1 + 32), v8);
LABEL_10:

}

uint64_t __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_2_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_4;
  block[3] = &unk_1E4AC4500;
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __82___SFAuthenticationContext_preemptOngoingAuthenticationWithPasccodeAuthentication__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __82___SFAuthenticationContext_preemptOngoingAuthenticationWithPasccodeAuthentication__block_invoke_2;
  v2[3] = &unk_1E4AC08D8;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __82___SFAuthenticationContext_preemptOngoingAuthenticationWithPasccodeAuthentication__block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "authenticationCustomUIProgressObserverForContext:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "authenticationDidFallbackToPasscode:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __47___SFAuthenticationContext_event_params_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTouchIDEventWithParameters:", *(_QWORD *)(a1 + 40));
}

@end
