@implementation INUIExtensionContext

void __41___INUIExtensionContext_viewWasCancelled__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewWasCancelled");

}

void __66___INUIExtensionContext_queryRepresentedPropertiesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryRepresentedPropertiesWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __46___INUIExtensionContext_desiresInteractivity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "desiresInteractivity:", *(_QWORD *)(a1 + 40));

}

void __101___INUIExtensionContext_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureForParameters:ofInteraction:interactiveBehavior:context:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));

}

void __48___INUIExtensionContext__errorHandlingHostProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[_INUIExtensionContext _errorHandlingHostProxy]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_error_impl(&dword_1DC055000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve extension context host: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

@end
