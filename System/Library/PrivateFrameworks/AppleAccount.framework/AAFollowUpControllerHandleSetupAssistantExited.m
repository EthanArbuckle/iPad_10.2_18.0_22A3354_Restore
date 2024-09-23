@implementation AAFollowUpControllerHandleSetupAssistantExited

void ___AAFollowUpControllerHandleSetupAssistantExited_block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (a2)
  {
    objc_msgSend(a2, "userInfo");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "postFollowUpWithIdentifier:userInfo:completion:", AAFollowUpIdentifierVerifyTerms[0], v3, &__block_literal_global_294);
    }
    else
    {
      _AALogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "No follow up userInfo found... nothing to see here!", v5, 2u);
      }

    }
  }
  else
  {
    _AALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "No follow up found... nothing to see here!", buf, 2u);
    }
  }

}

void ___AAFollowUpControllerHandleSetupAssistantExited_block_invoke_293(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (a2)
      v6 = CFSTR("YES");
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Reposted follow up with success: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }

}

@end
