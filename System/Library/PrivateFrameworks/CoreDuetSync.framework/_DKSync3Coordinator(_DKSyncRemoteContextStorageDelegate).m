@implementation _DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate)

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate hasKnowledgeOfKeyPath:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_21AA79000, v1, v2, "%{public}@: Failed to handle remote context storage request due to missing or invalid parameters", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate hasKnowledgeOfKeyPath:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_21AA79000, v1, v2, "%{public}@: Remote context store has knowledge of key path: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate hasKnowledgeOfKeyPath:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_21AA79000, v1, v2, "%{public}@: Remote context store does not have knowledge of key path: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate subscribeToChangesWithPeer:registrationIdentifier:predicate:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_21AA79000, v1, v2, "%{public}@: Failed to handle remote context storage request due to missing or invalid parameters", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate unsubscribeFromChangesWithPeer:registrationIdentifier:predicate:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_21AA79000, v1, v2, "%{public}@: Failed to handle remote context storage request due failure to create registration object", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

@end
