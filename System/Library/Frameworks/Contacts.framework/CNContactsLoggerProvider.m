@implementation CNContactsLoggerProvider

+ (CNContactsLoggerProvider)defaultProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CNContactsLoggerProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_0 != -1)
    dispatch_once(&defaultProvider_cn_once_token_0, block);
  return (CNContactsLoggerProvider *)(id)defaultProvider_cn_once_object_0;
}

- (CNAPITriageLogger)apiTriageLogger
{
  cn_objectResultWithObjectLock();
  return (CNAPITriageLogger *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNContactsLogger)contactsLogger
{
  cn_objectResultWithObjectLock();
  return (CNContactsLogger *)(id)objc_claimAutoreleasedReturnValue();
}

id __42__CNContactsLoggerProvider_contactsLogger__block_invoke(uint64_t a1)
{
  void *v2;
  _CNContactsLogger *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(_CNContactsLogger);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return v2;
}

id __43__CNContactsLoggerProvider_apiTriageLogger__block_invoke(uint64_t a1)
{
  void *v2;
  CNAPITriageLogger *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_alloc_init(CNAPITriageLogger);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return v2;
}

void __43__CNContactsLoggerProvider_defaultProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultProvider_cn_once_object_0;
  defaultProvider_cn_once_object_0 = (uint64_t)v1;

}

- (CNFavoritesLogger)favoritesLogger
{
  cn_objectResultWithObjectLock();
  return (CNFavoritesLogger *)(id)objc_claimAutoreleasedReturnValue();
}

id __43__CNContactsLoggerProvider_favoritesLogger__block_invoke(uint64_t a1)
{
  void *v2;
  _CNFavoritesLogger *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_alloc_init(_CNFavoritesLogger);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return v2;
}

- (CNSpotlightIndexingLogger)spotlightIndexingLogger
{
  cn_objectResultWithObjectLock();
  return (CNSpotlightIndexingLogger *)(id)objc_claimAutoreleasedReturnValue();
}

id __51__CNContactsLoggerProvider_spotlightIndexingLogger__block_invoke(uint64_t a1)
{
  void *v2;
  _CNSpotlightIndexingLogger *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(_CNSpotlightIndexingLogger);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v2;
}

- (CNRegulatoryLogger)regulatoryLogger
{
  cn_objectResultWithObjectLock();
  return (CNRegulatoryLogger *)(id)objc_claimAutoreleasedReturnValue();
}

id __44__CNContactsLoggerProvider_regulatoryLogger__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13B50]), "initWithAuditToken:assumedIdentity:", 0, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return v2;
}

- (CNGeminiLogger)geminiLogger
{
  cn_objectResultWithObjectLock();
  return (CNGeminiLogger *)(id)objc_claimAutoreleasedReturnValue();
}

id __40__CNContactsLoggerProvider_geminiLogger__block_invoke(uint64_t a1)
{
  void *v2;
  _CNGeminiLogger *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    v3 = objc_alloc_init(_CNGeminiLogger);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return v2;
}

- (CNImageUtilitiesLogger)imageUtilitiesLogger
{
  cn_objectResultWithObjectLock();
  return (CNImageUtilitiesLogger *)(id)objc_claimAutoreleasedReturnValue();
}

id __48__CNContactsLoggerProvider_imageUtilitiesLogger__block_invoke(uint64_t a1)
{
  void *v2;
  _CNImageUtilitiesLogger *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (!v2)
  {
    v3 = objc_alloc_init(_CNImageUtilitiesLogger);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUtilitiesLogger, 0);
  objc_storeStrong((id *)&self->_apiTriageLogger, 0);
  objc_storeStrong((id *)&self->_geminiLogger, 0);
  objc_storeStrong((id *)&self->_favoritesLogger, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_spotlightIndexingLogger, 0);
  objc_storeStrong((id *)&self->_contactsLogger, 0);
}

@end
