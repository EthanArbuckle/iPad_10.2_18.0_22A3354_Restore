@implementation CHSApplicationProcessStateChangeConsumer

- (void)applicationWithBundleIdentifierEnteredForeground:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CHSLogChronoServices();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "noting foreground launch for %@ with widget extension; trigger metadata query",
      (uint8_t *)&v6,
      0xCu);
  }

  -[CHSChronoServicesConnection reloadDescriptorsForContainerBundleIdentifier:completion:](self->_connection, "reloadDescriptorsForContainerBundleIdentifier:completion:", v4, &__block_literal_global_3);
}

void __93__CHSApplicationProcessStateChangeConsumer_applicationWithBundleIdentifierEnteredForeground___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __93__CHSApplicationProcessStateChangeConsumer_applicationWithBundleIdentifierEnteredForeground___block_invoke_cold_1((uint64_t)v6, v7);
  }
  else
  {
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
      {
        objc_msgSend(v5, "descriptors");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v3, "count");
      }
      else
      {
        v8 = 0;
      }
      v9 = 134217984;
      v10 = v8;
      _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "CHSApplicationProcessStateChangeConsumer: cacheDescriptors request completed with %lu extensions found", (uint8_t *)&v9, 0xCu);
      if (v5)

    }
  }

}

- (CHSApplicationProcessStateChangeConsumer)init
{
  void *v3;
  CHSApplicationProcessStateChangeConsumer *v4;

  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CHSApplicationProcessStateChangeConsumer initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (CHSApplicationProcessStateChangeConsumer)initWithConnection:(id)a3
{
  id v5;
  CHSApplicationProcessStateChangeConsumer *v6;
  CHSApplicationProcessStateChangeConsumer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSApplicationProcessStateChangeConsumer;
  v6 = -[CHSApplicationProcessStateChangeConsumer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __93__CHSApplicationProcessStateChangeConsumer_applicationWithBundleIdentifierEnteredForeground___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18FB18000, a2, OS_LOG_TYPE_ERROR, "CHSApplicationProcessStateChangeConsumer: cacheDescriptors request failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
