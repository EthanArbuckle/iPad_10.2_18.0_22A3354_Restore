@implementation HFErrorHandler

void __31__HFErrorHandler_sharedHandler__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_240;
  _MergedGlobals_240 = (uint64_t)v1;

}

- (void)logError:(id)a3 operationDescription:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    HFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v8)
      {
        objc_msgSend((id)objc_opt_class(), "descriptionLocalizationKeyForError:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412802;
        v14 = v6;
        v15 = 2112;
        v16 = v9;
        v17 = 2112;
        v18 = v5;
        v10 = "HFErrorHandler: [Log] Operation: %@ encountered error: %@ <%@>";
        v11 = v7;
        v12 = 32;
LABEL_9:
        _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, v12);

      }
    }
    else if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "descriptionLocalizationKeyForError:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      v10 = "HFErrorHandler: Encountered error: %@ <%@>";
      v11 = v7;
      v12 = 22;
      goto LABEL_9;
    }

  }
}

+ (id)sharedHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HFErrorHandler_sharedHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED378FC0 != -1)
    dispatch_once(&qword_1ED378FC0, block);
  return (id)_MergedGlobals_240;
}

- (void)handleError:(id)a3
{
  -[HFErrorHandler handleError:operationType:options:retryBlock:cancelBlock:](self, "handleError:operationType:options:retryBlock:cancelBlock:", a3, 0, 0, 0, 0);
}

- (void)handleError:(id)a3 retryBlock:(id)a4 cancelBlock:(id)a5
{
  -[HFErrorHandler handleError:operationType:options:retryBlock:cancelBlock:](self, "handleError:operationType:options:retryBlock:cancelBlock:", a3, 0, 0, a4, a5);
}

- (void)handleError:(id)a3 operationType:(id)a4 options:(id)a5 retryBlock:(id)a6 cancelBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  char isKindOfClass;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id *v64;
  void *v65;
  id *v66;
  int v67;
  id *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[4];
  void *v75;
  void (**v76)(_QWORD);
  void *v77;
  _QWORD v78[4];
  id v79;
  void (**v80)(_QWORD);
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t);
  void *v85;
  id v86;
  id v87;
  id v88;
  _QWORD aBlock[5];
  _QWORD block[5];
  id v91;
  id v92;
  id v93;
  id v94;
  void (**v95)(_QWORD);
  uint8_t buf[4];
  id v97;
  __int16 v98;
  id v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  if (v12)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    {
      -[HFErrorHandler presentingAlertOperationType](self, "presentingAlertOperationType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v13);

      if (v18)
      {
        HFLogForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_opt_class(), "descriptionLocalizationKeyForError:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v97 = v20;
          v98 = 2112;
          v99 = v12;
          v100 = 2112;
          v101 = v13;
          _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "HFErrorHandler: Suppressing error: %@ <%@> for operation: %@ because an alert for that operation is actively being presented", buf, 0x20u);

        }
      }
      else
      {
        if (!v13)
        {
          objc_msgSend(v12, "userInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("HFErrorUserInfoOperationKey"));
          v13 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v12, "userInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HFErrorUserInfoOptionsKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          if (v14)
          {
            v24 = (void *)objc_msgSend(v14, "mutableCopy");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v25 = v24;
          objc_msgSend(v24, "addEntriesFromDictionary:", v23);

          v14 = v25;
        }
        if (-[HFErrorHandler _isErrorIndicativeOfApplicationBug:operationType:options:](self, "_isErrorIndicativeOfApplicationBug:operationType:options:", v12, v13, v14))
        {
          NSLog(CFSTR("Received error that's indicative of an application bug: %@ (operation: %@)"), v12, v13);
        }
        v26 = -[HFErrorHandler canIgnoreError:](self, "canIgnoreError:", v12);
        HFLogForCategory(0);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v26)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend((id)objc_opt_class(), "descriptionLocalizationKeyForError:", v12);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v97 = v13;
            v98 = 2112;
            v99 = v29;
            v100 = 2112;
            v101 = v12;
            _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "HFErrorHandler: [Ignore] Operation: %@ encountered error: %@ <%@>", buf, 0x20u);

          }
          if (v16)
            v16[2](v16);
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "descriptionLocalizationKeyForError:", v12);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v97 = v13;
            v98 = 2112;
            v99 = v58;
            v100 = 2112;
            v101 = v12;
            _os_log_error_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_ERROR, "HFErrorHandler: Operation: %@ encountered error: %@ <%@>", buf, 0x20u);

          }
          -[HFErrorHandler _localizedTitleForError:operationType:options:](self, "_localizedTitleForError:operationType:options:", v12, v13, v14);
          v30 = objc_claimAutoreleasedReturnValue();
          -[HFErrorHandler _localizedDescriptionForError:operationType:options:](self, "_localizedDescriptionForError:operationType:options:", v12, v13, v14);
          v31 = objc_claimAutoreleasedReturnValue();
          v69 = v23;
          if (v15)
            v67 = !-[HFErrorHandler _isErrorPermanent:operationType:options:](self, "_isErrorPermanent:operationType:options:", v12, v13, v14);
          else
            v67 = 0;
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HFErrorHandlerOptionPresentingViewControllerForAlert"));
          v32 = (id)objc_claimAutoreleasedReturnValue();
          v70 = (void *)v31;
          v71 = (void *)v30;
          if (!v32)
          {
            objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "keyWindow");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v65 = v34;
            objc_msgSend(v34, "rootViewController");
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "presentedViewController");
            v35 = objc_claimAutoreleasedReturnValue();
            v72 = v32;
            if (v35)
            {
              v36 = (void *)v35;
              v37 = v32;
              while (1)
              {
                objc_msgSend(v37, "presentedViewController");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "isBeingDismissed");

                if ((v39 & 1) != 0)
                  break;
                objc_msgSend(v37, "presentedViewController");
                v32 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v32, "presentedViewController");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = v32;
                if (!v36)
                  goto LABEL_34;
              }
              v32 = v37;
            }
LABEL_34:
            if (!v32)
              NSLog(CFSTR("No view controller was specified to present the alert, and the topmost view controller in the app couldn't be found to use as a fallback. Key window: %@. Root view controller: %@"), v65, v72);

            v31 = (uint64_t)v70;
            v30 = (uint64_t)v71;
          }
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_194;
          aBlock[3] = &unk_1EA730040;
          aBlock[4] = self;
          v40 = _Block_copy(aBlock);
          objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v30, v31, 1);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (v67)
          {
            _HFLocalizedStringWithDefaultValue(CFSTR("HFErrorButtonTitleTryAgain"), CFSTR("HFErrorButtonTitleTryAgain"), 1);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HFErrorHandlerOptionRetryButtonText"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HFErrorHandlerOptionRetryButtonText"));
              v43 = objc_claimAutoreleasedReturnValue();

              v61 = (void *)v43;
            }
            v44 = (void *)MEMORY[0x1E0CEA2E0];
            v82 = MEMORY[0x1E0C809B0];
            v83 = 3221225472;
            v84 = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_201;
            v85 = &unk_1EA730068;
            v68 = &v87;
            v87 = v15;
            v66 = &v88;
            v59 = v40;
            v88 = v59;
            v64 = &v86;
            v86 = v61;
            v60 = v86;
            objc_msgSend(v44, "actionWithTitle:style:handler:");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "addAction:", v45);

            _HFLocalizedStringWithDefaultValue(CFSTR("HFErrorButtonTitleCancel"), CFSTR("HFErrorButtonTitleCancel"), 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HFErrorHandlerOptionCancelButtonTextKey"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v48 = objc_opt_isKindOfClass();

            if ((v48 & 1) != 0)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HFErrorHandlerOptionCancelButtonTextKey"));
              v49 = objc_claimAutoreleasedReturnValue();

              v46 = (void *)v49;
            }
            v50 = (void *)MEMORY[0x1E0CEA2E0];
            v78[0] = MEMORY[0x1E0C809B0];
            v78[1] = 3221225472;
            v78[2] = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_205;
            v78[3] = &unk_1EA730068;
            v80 = v16;
            v81 = v59;
            v79 = v46;
            v62 = v59;
            v51 = v46;
            objc_msgSend(v50, "actionWithTitle:style:handler:", v51, 0, v78);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v73;
            objc_msgSend(v73, "addAction:", v52);

            v54 = v60;
          }
          else
          {
            _HFLocalizedStringWithDefaultValue(CFSTR("HFErrorButtonTitleOK"), CFSTR("HFErrorButtonTitleOK"), 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = (void *)MEMORY[0x1E0CEA2E0];
            v74[0] = MEMORY[0x1E0C809B0];
            v74[1] = 3221225472;
            v74[2] = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_208;
            v74[3] = &unk_1EA730068;
            v68 = (id *)&v76;
            v76 = v16;
            v77 = v40;
            v64 = &v75;
            v66 = &v77;
            v75 = v55;
            v56 = v55;
            v54 = v40;
            v57 = v63;
            v62 = v56;
            objc_msgSend(v57, "actionWithTitle:style:handler:", v56, 0, v74);
            v51 = (id)objc_claimAutoreleasedReturnValue();
            v53 = v73;
            objc_msgSend(v73, "addAction:", v51);
          }

          -[HFErrorHandler setPresentingAlertOperationType:](self, "setPresentingAlertOperationType:", v13);
          objc_msgSend(v32, "presentViewController:animated:completion:", v53, 1, 0);

          v23 = v69;
        }

      }
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke;
      block[3] = &unk_1EA730018;
      block[4] = self;
      v91 = v12;
      v13 = v13;
      v92 = v13;
      v14 = v14;
      v93 = v14;
      v94 = v15;
      v95 = v16;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleError:operationType:options:retryBlock:cancelBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_194(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x44uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFErrorHandler: User dismissed error alert by tapping \"%@\", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setPresentingAlertOperationType:", 0);
}

uint64_t __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_201(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x44uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HFErrorHandler handleError:operationType:options:retryBlock:cancelBlock:]_block_invoke";
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped retry button from alert", (uint8_t *)&v5, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_205(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x44uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HFErrorHandler handleError:operationType:options:retryBlock:cancelBlock:]_block_invoke";
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from alert", (uint8_t *)&v5, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_208(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x44uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HFErrorHandler handleError:operationType:options:retryBlock:cancelBlock:]_block_invoke";
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'OK' from alert", (uint8_t *)&v5, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)canIgnoreError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    v7 = (unint64_t)(v6 - 15) >= 0x36;
    v8 = 0x24000003800101uLL >> (v6 - 15);
  }
  else
  {
    objc_msgSend(v3, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("HFErrorDomain"));

    if (!v10)
    {
      v13 = 0;
      goto LABEL_9;
    }
    v11 = objc_msgSend(v3, "code");
    v7 = v11 >= 0x35;
    v8 = 0x10402000000000uLL >> v11;
  }
  v12 = v8 & 1;
  v13 = !v7 && v12;
LABEL_9:

  return v13;
}

- (BOOL)_isErrorIndicativeOfApplicationBug:(id)a3 operationType:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  unint64_t v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HFOperationNamingObject")) & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

  if (!v9)
  {
    objc_msgSend(v6, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("HFErrorDomain"));

    if (v14)
    {
      v15 = objc_msgSend(v6, "code");
      if (v15 <= 0x33)
        LOBYTE(v12) = (0xC000200000000uLL >> v15) & 1;
      else
        LOBYTE(v12) = 0;
      goto LABEL_15;
    }
LABEL_11:
    LOBYTE(v12) = 0;
    goto LABEL_15;
  }
  v10 = objc_msgSend(v6, "code");
  if (v10 <= 0x3E)
  {
    if (((1 << v10) & 0x41003000597800E8) != 0)
    {
LABEL_14:
      LOBYTE(v12) = 1;
      goto LABEL_15;
    }
    if (((1 << v10) & 0x8480000000000) != 0)
    {
      v17[0] = CFSTR("HFOperationChangePassword");
      v17[1] = CFSTR("HFOperationEditServiceGroup");
      v17[2] = CFSTR("HFOperationEditService");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v7) ^ 1;

      goto LABEL_15;
    }
  }
  LOBYTE(v12) = 0;
  if (v10 - 69 <= 0xB && ((1 << (v10 - 69)) & 0x80F) != 0)
    goto LABEL_14;
LABEL_15:

  return v12;
}

- (BOOL)_isErrorPermanent:(id)a3 operationType:(id)a4 options:(id)a5
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  unint64_t v14;
  void *v16;
  int v17;
  unint64_t v18;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

  if (v7)
  {
    v8 = objc_msgSend(v5, "code");
    if ((unint64_t)(v8 - 4) <= 0x3F && ((1 << (v8 - 4)) & 0xF8AF402000005C71) != 0)
      goto LABEL_12;
    v9 = 1;
    if ((unint64_t)(v8 - 73) <= 0xC)
    {
      v10 = 1 << (v8 - 73);
      v11 = 7795;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v5, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("HFErrorDomain"));

    if (!v13)
    {
      objc_msgSend(v5, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB9328]);

      if (v17)
      {
        v18 = objc_msgSend(v5, "code");
        if (v18 <= 8)
          v9 = (0xD9u >> v18) & 1;
        else
          v9 = 1;
      }
      else
      {
        v9 = 1;
      }
      goto LABEL_13;
    }
    v14 = objc_msgSend(v5, "code");
    if (v14 - 74 <= 0x1C && ((1 << (v14 - 74)) & 0x1F0001AF) != 0)
      goto LABEL_12;
    v9 = 1;
    if (v14 <= 0x29)
    {
      v10 = 1 << v14;
      v11 = 0x28C00000020;
LABEL_11:
      if ((v10 & v11) != 0)
LABEL_12:
        v9 = 0;
    }
  }
LABEL_13:

  return v9;
}

- (id)_localizedTitleForError:(id)a3 operationType:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HFErrorUserInfoOptionTitleKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HFErrorHandlerOptionFailedItemName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "descriptionLocalizationKeyForError:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v14 = v11;
LABEL_3:
    v15 = v14;
    goto LABEL_19;
  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFError_%@_%@_withName_title"), v8, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFErrorHandler _localizedStringOrNilIfNotFoundForKey:](self, "_localizedStringOrNilIfNotFoundForKey:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFError_%@_withName_title"), v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFErrorHandler _localizedStringOrNilIfNotFoundForKey:](self, "_localizedStringOrNilIfNotFoundForKey:", v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_15;
      v16 = v19;
    }
    if ((objc_msgSend(v18, "containsString:", CFSTR("%@")) & 1) == 0)
      NSLog(CFSTR("Incorrectly formatted localizedFormatString in Strings file: %@"), v18);
    if (objc_msgSend(v18, "containsString:", CFSTR("%@")))
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@"), &v25, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v25;
      v21 = v20;
      if (v15)
      {

        goto LABEL_19;
      }
      NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v18, v20);

      goto LABEL_17;
    }
    v19 = v16;
LABEL_15:

  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFError_%@_%@_title"), v8, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFErrorHandler _localizedStringOrNilIfNotFoundForKey:](self, "_localizedStringOrNilIfNotFoundForKey:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFError_%@_title"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFErrorHandler _localizedStringOrNilIfNotFoundForKey:](self, "_localizedStringOrNilIfNotFoundForKey:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFError_HFOperationGeneric_title"), CFSTR("HFError_HFOperationGeneric_title"), 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
LABEL_19:

  return v15;
}

+ (id)localizedDescriptionForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_localizedDescriptionForError:operationType:options:", v3, &stru_1EA741FF8, MEMORY[0x1E0C9AA70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_localizedDescriptionForError:(id)a3 operationType:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HFErrorUserInfoOptionDescriptionKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend((id)objc_opt_class(), "descriptionLocalizationKeyForError:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFError_%@_%@_description"), v9, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFErrorHandler _localizedStringOrNilIfNotFoundForKey:](self, "_localizedStringOrNilIfNotFoundForKey:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v13 = (id)v16;
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFError_%@_description"), v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFErrorHandler _localizedStringOrNilIfNotFoundForKey:](self, "_localizedStringOrNilIfNotFoundForKey:", v17);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HFErrorHandlerOptionFailedItemName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v22 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), &v22, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v22;

      if (!v19)
        NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v17, v20);

      v13 = (id)v19;
    }

    goto LABEL_11;
  }
  v13 = v11;
LABEL_12:

  return v13;
}

- (id)_localizedStringOrNilIfNotFoundForKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  _HFLocalizedStringWithDefaultValue(v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", &stru_1EA741FF8) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", v3))
  {

    v4 = 0;
  }

  return v4;
}

+ (id)descriptionLocalizationKeyForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "_descriptionForHMErrorCode:", objc_msgSend(v4, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("HMErrorCode%@"), v8);
  }
  else
  {
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9328]);

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "_descriptionForHMHomeAddWalletKeyErrorCode:", objc_msgSend(v4, "code"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("HMHomeAddWalletKeyErrorCode%@"), v8);
    }
    else
    {
      objc_msgSend(v4, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("HFErrorDomain"));

      if (!v13)
      {
        v15 = 0;
        goto LABEL_8;
      }
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "_descriptionForHFErrorCode:", objc_msgSend(v4, "code"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("HFErrorCode%@"), v8);
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v15;
}

+ (id)_descriptionForHMHomeAddWalletKeyErrorCode:(int64_t)a3
{
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 9)
    return off_1EA730088[a3];
  HFLogForCategory(0x42uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315650;
    v8 = "+[HFErrorHandler _descriptionForHMHomeAddWalletKeyErrorCode:]";
    v9 = 2112;
    v10 = a1;
    v11 = 2048;
    v12 = a3;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%s(%@) UNKNOWN HOMEKIT ERROR %ld", (uint8_t *)&v7, 0x20u);
  }

  return 0;
}

+ (id)_descriptionForHMErrorCode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v6;
  id result;

  if (a3 <= 2000)
  {
    v6 = CFSTR("AccessDenied");
    switch(a3)
    {
      case -1:
        v6 = CFSTR("UnexpectedError");
        return v6;
      case 1:
        result = CFSTR("AlreadyExists");
        break;
      case 2:
        result = CFSTR("NotFound");
        break;
      case 3:
        result = CFSTR("InvalidParameter");
        break;
      case 4:
        result = CFSTR("AccessoryNotReachable");
        break;
      case 5:
        result = CFSTR("ReadOnlyCharacteristic");
        break;
      case 6:
        result = CFSTR("WriteOnlyCharacteristic");
        break;
      case 7:
        result = CFSTR("NotificationNotSupported");
        break;
      case 8:
        result = CFSTR("OperationTimedOut");
        break;
      case 9:
        result = CFSTR("AccessoryPoweredOff");
        break;
      case 10:
        return v6;
      case 11:
        result = CFSTR("ObjectAssociatedToAnotherHome");
        break;
      case 12:
        result = CFSTR("ObjectNotAssociatedToAnyHome");
        break;
      case 13:
        result = CFSTR("ObjectAlreadyAssociatedToHome");
        break;
      case 14:
        result = CFSTR("AccessoryIsBusy");
        break;
      case 15:
        result = CFSTR("OperationInProgress");
        break;
      case 16:
        result = CFSTR("AccessoryOutOfResources");
        break;
      case 17:
        result = CFSTR("InsufficientPrivileges");
        break;
      case 18:
        result = CFSTR("AccessoryPairingFailed");
        break;
      case 19:
        result = CFSTR("InvalidDataFormatSpecified");
        break;
      case 20:
        result = CFSTR("NilParameter");
        break;
      case 21:
        result = CFSTR("UnconfiguredParameter");
        break;
      case 22:
        result = CFSTR("InvalidClass");
        break;
      case 23:
        result = CFSTR("OperationCancelled");
        break;
      case 24:
        result = CFSTR("RoomForHomeCannotBeInZone");
        break;
      case 25:
        result = CFSTR("NoActionsInActionSet");
        break;
      case 26:
        result = CFSTR("NoRegisteredActionSets");
        break;
      case 27:
        result = CFSTR("MissingParameter");
        break;
      case 28:
        result = CFSTR("FireDateInPast");
        break;
      case 29:
        result = CFSTR("RoomForHomeCannotBeUpdated");
        break;
      case 30:
        result = CFSTR("ActionInAnotherActionSet");
        break;
      case 31:
        result = CFSTR("ObjectWithSimilarNameExistsInHome");
        break;
      case 32:
        result = CFSTR("HomeWithSimilarNameExists");
        break;
      case 33:
        result = CFSTR("RenameWithSimilarName");
        break;
      case 34:
        result = CFSTR("CannotRemoveNonBridgeAccessory");
        break;
      case 35:
        result = CFSTR("NameContainsProhibitedCharacters");
        break;
      case 36:
        result = CFSTR("NameDoesNotStartWithValidCharacters");
        break;
      case 37:
        result = CFSTR("UserIDNotEmailAddress");
        break;
      case 38:
        result = CFSTR("UserDeclinedAddingUser");
        break;
      case 39:
        result = CFSTR("UserDeclinedRemovingUser");
        break;
      case 40:
        result = CFSTR("UserDeclinedInvite");
        break;
      case 41:
        result = CFSTR("UserManagementFailed");
        break;
      case 42:
        result = CFSTR("RecurrenceTooSmall");
        break;
      case 43:
        result = CFSTR("InvalidValueType");
        break;
      case 44:
        result = CFSTR("ValueLowerThanMinimum");
        break;
      case 45:
        result = CFSTR("ValueHigherThanMaximum");
        break;
      case 46:
        result = CFSTR("StringLongerThanMaximum");
        break;
      case 47:
        result = CFSTR("HomeAccessNotAuthorized");
        break;
      case 48:
        result = CFSTR("OperationNotSupported");
        break;
      case 49:
        result = CFSTR("MaximumObjectLimitReached");
        break;
      case 50:
        result = CFSTR("AccessorySentInvalidResponse");
        break;
      case 51:
        result = CFSTR("StringShorterThanMinimum");
        break;
      case 52:
        result = CFSTR("GenericError");
        break;
      case 53:
        result = CFSTR("SecurityFailure");
        break;
      case 54:
        result = CFSTR("CommunicationFailure");
        break;
      case 55:
        result = CFSTR("MessageAuthenticationFailed");
        break;
      case 56:
        result = CFSTR("InvalidMessageSize");
        break;
      case 57:
        result = CFSTR("AccessoryDiscoveryFailed");
        break;
      case 58:
        result = CFSTR("ClientRequestError");
        break;
      case 59:
        result = CFSTR("AccessoryResponseError");
        break;
      case 60:
        result = CFSTR("NameDoesNotEndWithValidCharacters");
        break;
      case 61:
        result = CFSTR("AccessoryIsBlocked");
        break;
      case 62:
        result = CFSTR("InvalidAssociatedServiceType");
        break;
      case 63:
        result = CFSTR("ActionSetExecutionFailed");
        break;
      case 64:
        result = CFSTR("ActionSetExecutionPartialSuccess");
        break;
      case 65:
        result = CFSTR("ActionSetExecutionInProgress");
        break;
      case 66:
        result = CFSTR("AccessoryOutOfCompliance");
        break;
      case 67:
        result = CFSTR("DataResetFailure");
        break;
      case 68:
        result = CFSTR("NotificationAlreadyEnabled");
        break;
      case 69:
        result = CFSTR("RecurrenceMustBeOnSpecifiedBoundaries");
        break;
      case 70:
        result = CFSTR("DateMustBeOnSpecifiedBoundaries");
        break;
      case 71:
        result = CFSTR("CannotActivateTriggerTooFarInFuture");
        break;
      case 72:
        result = CFSTR("RecurrenceTooLarge");
        break;
      case 73:
        result = CFSTR("ReadWritePartialSuccess");
        break;
      case 74:
        result = CFSTR("ReadWriteFailure");
        break;
      case 75:
        result = CFSTR("NotSignedIntoiCloud");
        break;
      case 76:
        result = CFSTR("KeychainSyncNotEnabled");
        break;
      case 77:
        result = CFSTR("CloudDataSyncInProgress");
        break;
      case 78:
        result = CFSTR("NetworkUnavailable");
        break;
      case 79:
        result = CFSTR("AddAccessoryFailed");
        break;
      case 80:
        result = CFSTR("MissingEntitlement");
        break;
      case 81:
        result = CFSTR("CannotUnblockNonBridgeAccessory");
        break;
      case 82:
        result = CFSTR("DeviceLocked");
        break;
      case 83:
        result = CFSTR("CannotRemoveBuiltinActionSet");
        break;
      case 84:
        result = CFSTR("LocationForHomeDisabled");
        break;
      case 85:
        result = CFSTR("NotAuthorizedForLocationServices");
        break;
      case 86:
        result = CFSTR("ReferToUserManual");
        break;
      case 87:
        result = CFSTR("InvalidOrMissingAuthorizationData");
        break;
      case 88:
        result = CFSTR("BridgedAccessoryNotReachable");
        break;
      case 89:
        result = CFSTR("NotAuthorizedForMicrophoneAccess");
        break;
      case 90:
        result = CFSTR("IncompatibleNetwork");
        break;
      case 91:
        result = CFSTR("NoHomeHub");
        break;
      case 92:
        result = CFSTR("NoCompatibleHomeHub");
        break;
      case 93:
        result = CFSTR("IncompatibleAccessory");
        break;
      case 95:
        result = CFSTR("ObjectWithSimilarNameExists");
        break;
      case 96:
        result = CFSTR("OwnershipFailure");
        break;
      case 97:
        result = CFSTR("MaximumAccessoriesOfTypeInHome");
        break;
      case 98:
        result = CFSTR("WiFiCredentialGenerationFailed");
        break;
      case 99:
        result = CFSTR("EnterpriseNetworkNotSupported");
        break;
      case 100:
        result = CFSTR("TimedOutWaitingForAccessory");
        break;
      case 101:
        result = CFSTR("AccessoryCommunicationFailure");
        break;
      case 102:
        result = CFSTR("FailedToJoinNetwork");
        break;
      default:
        goto LABEL_139;
    }
    return result;
  }
  if (a3 <= 2399)
  {
    if (a3 <= 2099)
    {
      switch(a3)
      {
        case 2001:
          result = CFSTR("OperationCanceledByUser");
          break;
        case 2002:
          result = CFSTR("IncorrectSetupCode");
          break;
        case 2003:
          result = CFSTR("SecureAccessDenied");
          break;
        case 2004:
          result = CFSTR("UnsupportedSetupPayload");
          break;
        case 2005:
          result = CFSTR("MediaRemoteError");
          break;
        case 2006:
          result = CFSTR("QuotaExceeded");
          break;
        default:
          goto LABEL_139;
      }
      return result;
    }
    if (a3 > 2200)
    {
      if (a3 == 2201)
        return CFSTR("WeakPassword");
      if (a3 == 2300)
        return CFSTR("VoiceShortcutWithSimilarNameExists");
    }
    else
    {
      if (a3 == 2100)
        return CFSTR("NoTargetAccessory");
      if (a3 == 2200)
        return CFSTR("InvalidCharacters");
    }
LABEL_139:
    objc_msgSend(a1, "_descriptionForHMHomeAddWalletKeyErrorCode:", v3, v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (a3 <= 2499)
  {
    switch(a3)
    {
      case 2400:
        return CFSTR("AccessorySuspended");
      case 2401:
        return CFSTR("AccessorySuspendedLocally");
      case 2404:
        return CFSTR("OperationStarted");
    }
    goto LABEL_139;
  }
  switch(a3)
  {
    case 2500:
      result = CFSTR("ResetConfig");
      break;
    case 2501:
      result = CFSTR("HomeUIServiceTerminated");
      break;
    case 2502:
      result = CFSTR("HomeUIServiceBackgrounded");
      break;
    case 2503:
      result = CFSTR("NoClients");
      break;
    case 2504:
      result = CFSTR("AccessoryBrowserStopped");
      break;
    default:
      if (a3 != 2602)
        goto LABEL_139;
      result = CFSTR("AccessCodeDuplicate");
      break;
  }
  return result;
}

+ (id)_descriptionForHFErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0x68)
    return 0;
  else
    return *(&off_1EA7300D0 + a3 + 1);
}

- (NSString)presentingAlertOperationType
{
  return self->_presentingAlertOperationType;
}

- (void)setPresentingAlertOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_presentingAlertOperationType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingAlertOperationType, 0);
}

@end
