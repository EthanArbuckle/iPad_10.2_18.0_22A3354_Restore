@implementation SFPageLoadErrorController

uint64_t __39___SFPageLoadErrorController_addAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "actionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 32), a2);

  }
  return objc_msgSend(*(id *)(a1 + 40), "performAction:forAlert:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __68___SFPageLoadErrorController_addFormAlertWithTitle_decisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85___SFPageLoadErrorController_showErrorPageWithTitle_bodyText_learnMoreLink_forError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  v2 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("data:text/html,"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_loadAlternateHTMLString:baseURL:forUnreachableURL:", v2, v3, a1[6]);

}

void __68___SFPageLoadErrorController__loadCertificateWarningPageForContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "failingURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_loadAlternateHTMLString:baseURL:forUnreachableURL:", v2, v3, v4);

}

void __109___SFPageLoadErrorController__handleCertificateError_forURL_isMainFrame_recoveryAttempter_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11[4];
  id location;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
  {
    objc_msgSend(a2, "timeIntervalSinceNow");
    v4 = v3;
    v5 = objc_msgSend(MEMORY[0x1E0D8A820], "certificateWarningCannotBeBypassedForTrust:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D8A820], "certificateWarningCategoryForError:trustIncludesRevokedCertificate:clockSkew:", *(_QWORD *)(a1 + 40), v5, *(double *)&v4);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0D8A820], "numberOfDaysBetweenCertificateValidityRangeAndNow:", *(_QWORD *)(a1 + 48));
    objc_initWeak(&location, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109___SFPageLoadErrorController__handleCertificateError_forURL_isMainFrame_recoveryAttempter_completionHandler___block_invoke_2;
    block[3] = &unk_1E4AC06E0;
    objc_copyWeak(v11, &location);
    v11[1] = v6;
    v9 = *(id *)(a1 + 56);
    v11[2] = v7;
    v11[3] = v4;
    v10 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __109___SFPageLoadErrorController__handleCertificateError_forURL_isMainFrame_recoveryAttempter_completionHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v3 = objc_alloc(MEMORY[0x1E0D8A820]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = objc_loadWeakRetained(v12 + 2);
    objc_msgSend(v7, "backForwardList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v3, "initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:", v5, v4, v6, v9 != 0, *(double *)(a1 + 72));

    objc_msgSend(v12, "_loadCertificateWarningPageForContext:", v10);
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);

    WeakRetained = v12;
  }

}

void __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke(uint64_t a1, char a2)
{
  _BYTE *v3;
  unsigned int v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  __CFString *v15;

  if ((a2 & 1) == 0)
  {
    v3 = *(_BYTE **)(a1 + 32);
    if (v3[112])
    {
      objc_msgSend(v3, "clearFailedRequest");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_web_errorIsInDomain:", *MEMORY[0x1E0CB32E8]))
      {
        if ((unint64_t)(*(_QWORD *)(a1 + 56) + 1009) <= 6)
          v4 = (0x61u >> (*(_BYTE *)(a1 + 56) - 15)) & 1;
        else
          v4 = 0;
      }
      else
      {
        v4 = 0;
      }
      if (objc_msgSend(*(id *)(a1 + 40), "_web_errorIsInDomain:", CFSTR("WebKitServiceWorker")))
        v5 = *(_QWORD *)(a1 + 56) == 0;
      else
        v5 = 0;
      if ((v4 | v5) == 1)
      {
        v6 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", *(_QWORD *)(a1 + 48));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_setFailedRequest:", v7);

      }
      v8 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_cold_1((id *)(a1 + 40), v8);
      if (isDiffieHellmanError(*(void **)(a1 + 40)))
        v9 = CFSTR("https://support.apple.com/kb/HT204937");
      else
        v9 = 0;
      v11 = *(void **)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_189;
      v13[3] = &unk_1E4AC0730;
      v13[4] = v11;
      v14 = v10;
      v15 = (__CFString *)v9;
      objc_msgSend(v11, "_fetchSpecializedMessageForError:URL:completionHandler:", v14, v12, v13);

    }
  }
}

void __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_189(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_genericMessageForError:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "_titleForError:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "showErrorPageWithTitle:bodyText:learnMoreLink:forError:", v6, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __51___SFPageLoadErrorController_handleFrameLoadError___block_invoke(uint64_t a1)
{
  return attemptRecovery(*(void **)(a1 + 32));
}

uint64_t __61___SFPageLoadErrorController_handleSubframeCertificateError___block_invoke(uint64_t a1)
{
  return attemptRecovery(*(void **)(a1 + 32));
}

void __100___SFPageLoadErrorController_handleLegacyTLSWithFailingURL_clickThroughURL_authenticationChallenge___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0D8A820]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v4, "backForwardList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "initLegacyTLSWarningWithFailingURL:canGoBack:", v3, v6 != 0);
    v8 = WeakRetained[6];
    WeakRetained[6] = (id)v7;

    objc_storeStrong(WeakRetained + 12, *(id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_loadCertificateWarningPageForContext:", WeakRetained[6]);
  }

}

void __50___SFPageLoadErrorController_visitInsecureWebsite__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rememberCertificateBypassForProtectionSpace:inPrivateBrowsing:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), 0);

  objc_msgSend(*(id *)(a1 + 32), "_continueAfterCertificateAlertWithURL:trust:recoveryAttempter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = 0;

}

void __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_cold_1(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  os_log_type_t v9;
  const char *v10;
  uint8_t *v11;
  void *v12;

  v3 = *a1;
  v4 = a2;
  objc_msgSend(v3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("networkTaskDescription"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(v7, v8, v9, v10, v11, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

@end
