@implementation _LTPreflightChecker

- (_LTPreflightChecker)init
{
  _LTPreflightChecker *v2;
  _LTPreflightChecker *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  _LTPreflightChecker *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LTPreflightChecker;
  v2 = -[_LTPreflightChecker init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_localeResolver, v2);
    objc_msgSend((id)objc_opt_class(), "_sharedQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

+ (id)_sharedQueue
{
  if (_sharedQueue_onceToken != -1)
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_6);
  return (id)_sharedQueue_sharedQueue;
}

- (void)preflightConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  OS_dispatch_queue *v14;
  id v15;
  id v16;
  id location;

  v6 = a4;
  v7 = self->_queue;
  v8 = (void *)objc_msgSend(a3, "copy");
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke;
  block[3] = &unk_250693E28;
  objc_copyWeak(&v16, &location);
  v13 = v8;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_checkTranslationSupportForConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  OS_dispatch_queue *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = self->_queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);
  -[_LTPreflightChecker delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v9, "isTranslationSupportedOnCurrentDeviceForPreflightChecker:", self))
  {
    v10 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v10, "setDeviceSupportsTranslation:", 0);
    v11 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_LTPreflightChecker _checkTranslationSupportForConfiguration:completion:].cold.1();
    v12 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v10, "effectiveSourceLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effectiveTargetLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lt_unsupportedPairingErrorWithSource:target:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __75___LTPreflightChecker__checkTranslationSupportForConfiguration_completion___block_invoke;
    v16[3] = &unk_250693E50;
    v17 = v8;
    v18 = v7;
    -[_LTPreflightChecker _callDelegateOrGiveError:forConfiguration:completion:](self, "_callDelegateOrGiveError:forConfiguration:completion:", v15, v10, v16);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }

}

- (void)_callDelegateOrGiveError:(id)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_LTPreflightChecker delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v12 = objc_msgSend(v9, "nextStep");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76___LTPreflightChecker__callDelegateOrGiveError_forConfiguration_completion___block_invoke;
    v14[3] = &unk_250693EA0;
    objc_copyWeak(&v16, &location);
    v15 = v10;
    objc_msgSend(v11, "preflightChecker:continueCheckingFromStep:forConfiguration:completion:", self, v12, v9, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_LTPreflightChecker _callDelegateOrGiveError:forConfiguration:completion:].cold.1();
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v8);
  }

}

- (void)_resolveSourceLocaleIfNeeded:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD *v7;
  OS_dispatch_queue *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (*v16)(_QWORD *, void *);
  _QWORD *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[4];
  OS_dispatch_queue *v27;
  id v28;
  _QWORD *v29;
  uint8_t buf[16];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);
  objc_msgSend(v6, "resolvedSourceLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v6, "requestedSourceLocale");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v12 = (void *)MEMORY[0x24BDBCEA0];
      v31[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportedLocales");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void (*)(_QWORD *, void *))v7[2];
      v17 = v7;
      if (v15)
      {
        v18 = v15;
LABEL_19:
        v16(v17, v18);
        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(v6, "lowConfidenceLocales");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_235438000, v20, OS_LOG_TYPE_INFO, "Previously determined low confidence LID on configuration, no need to ask the localeResolver to do LID again", buf, 2u);
        }
        ((void (*)(_QWORD *, _QWORD))v7[2])(v7, 0);
        goto LABEL_21;
      }
      -[_LTPreflightChecker localeResolver](self, "localeResolver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v6, "sourceStrings");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          -[_LTPreflightChecker localeResolver](self, "localeResolver");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke;
          v26[3] = &unk_250693F30;
          v27 = v8;
          v28 = v6;
          v29 = v7;
          objc_msgSend(v23, "resolveSourceLocaleForConfiguration:completion:", v28, v26);

LABEL_20:
LABEL_21:

          goto LABEL_22;
        }
        v25 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[_LTPreflightChecker _resolveSourceLocaleIfNeeded:completion:].cold.2();
      }
      else
      {
        v24 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[_LTPreflightChecker _resolveSourceLocaleIfNeeded:completion:].cold.1();
      }
      v16 = (void (*)(_QWORD *, void *))v7[2];
      v17 = v7;
    }
    v18 = 0;
    goto LABEL_19;
  }
  ((void (*)(_QWORD *, void *))v7[2])(v7, v9);
LABEL_22:

}

- (void)resolveTargetLocaleIfNeeded:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  OS_dispatch_queue *v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke;
  block[3] = &unk_250693E28;
  objc_copyWeak(&v16, &location);
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_resolveTargetLocaleIfNeeded:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "resolvedTargetLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    objc_msgSend(v6, "requestedTargetLocale");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x24BDBCEA0];
      v23[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportedLocales");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v12, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[_LTPreflightChecker _resolveTargetLocaleIfNeeded:completion:].cold.1(v15, v10);
      }
      v7[2](v7, v14);
    }
    else
    {
      objc_msgSend(v6, "systemLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v14 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEA0], "lt_preferredLocales");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = (void *)MEMORY[0x24BDBCEA0];
      objc_msgSend(v6, "resolvedSourceLocale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportedLocales");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lt_defaultTargetForSource:systemLocale:availableLocales:targetMap:", v20, v14, v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v22);
    }

  }
}

- (void)_resolveLocalePairingForConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  OS_dispatch_queue *v8;
  void *v9;
  void *v10;
  _LTLocalePair *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = self->_queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);
  objc_msgSend(v6, "resolvedSourceLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "resolvedTargetLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[_LTLocalePair initWithSourceLocale:targetLocale:]([_LTLocalePair alloc], "initWithSourceLocale:targetLocale:", v9, v10);
      objc_msgSend(v6, "supportedLocalePairs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v11);

      if ((v13 & 1) != 0)
      {
        v7[2](v7, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "lt_unsupportedPairingErrorWithSource:target:", v9, v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = _LTOSLogTextAPI();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[_LTPreflightChecker _resolveLocalePairingForConfiguration:completion:].cold.1(v19, v11);
        ((void (**)(id, void *))v7)[2](v7, v18);

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "effectiveTargetLocale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lt_unsupportedTargetLanguageError:", v17);
      v11 = (_LTLocalePair *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, _LTLocalePair *))v7)[2](v7, v11);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "effectiveSourceLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lt_unsupportedSourceLanguageError:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *))v7)[2](v7, v10);
  }

}

- (void)resolveSourceLocaleForConfiguration:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sourceStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70___LTPreflightChecker_resolveSourceLocaleForConfiguration_completion___block_invoke;
  v10[3] = &unk_250693F58;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[_LTTranslator languagesForText:usingModel:useDedicatedTextMachPort:completion:](_LTTranslator, "languagesForText:usingModel:useDedicatedTextMachPort:completion:", v7, 0, 1, v10);

}

- (_LTPreflightCheckerDelegate)delegate
{
  return (_LTPreflightCheckerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_LTPreflightLocaleResolving)localeResolver
{
  return (_LTPreflightLocaleResolving *)objc_loadWeakRetained((id *)&self->_localeResolver);
}

- (void)setLocaleResolver:(id)a3
{
  objc_storeWeak((id *)&self->_localeResolver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localeResolver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_checkTranslationSupportForConfiguration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_235438000, v0, v1, "Delegate says translation isn't supported on the current device, showing error to the user", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_callDelegateOrGiveError:forConfiguration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_235438000, v0, v1, "Delegate doesn't implement selector for continuing validation, can't proceed with translation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_resolveSourceLocaleIfNeeded:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
}

- (void)_resolveSourceLocaleIfNeeded:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_235438000, v0, v1, "Can't resolve source locale since there's no source strings to use with LID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_resolveTargetLocaleIfNeeded:(void *)a1 completion:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "_ltLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v3, v5, "Failed to find a valid version of the requested target locale %{public}@; giving error to client",
    v6);

  OUTLINED_FUNCTION_6_0();
}

- (void)_resolveLocalePairingForConfiguration:(void *)a1 completion:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "combinedLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v3, v5, "Client requested pair with valid source and target, but the pairing isn't supported: %{public}@", v6);

  OUTLINED_FUNCTION_6_0();
}

@end
