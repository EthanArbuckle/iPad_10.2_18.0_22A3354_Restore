@implementation BLSBacklightFBSSceneEnvironmentActionHandler

- (id)respondToActions:(id)a3 forFBSScene:(id)a4 fromTransitionContext:(id)a5
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  dispatch_time_t v17;
  NSObject *v18;
  void *v19;
  void *v21;
  _QWORD block[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  bls_scenes_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BLSBacklightFBSSceneEnvironmentActionHandler respondToActions:forFBSScene:fromTransitionContext:].cold.2(v5);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          bls_scenes_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v13;
            _os_log_debug_impl(&dword_1B0C75000, v14, OS_LOG_TYPE_DEBUG, "respondToActions expect to handle action:%@", buf, 0xCu);
          }
          v15 = v6;
        }
        else
        {
          bls_scenes_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v13;
            _os_log_debug_impl(&dword_1B0C75000, v14, OS_LOG_TYPE_DEBUG, "respondToActions unhandled action:%@", buf, 0xCu);
          }
          v15 = v21;
        }

        objc_msgSend(v15, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      v10 = v16;
    }
    while (v16);
  }

  if (objc_msgSend(v6, "count"))
  {
    v17 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__BLSBacklightFBSSceneEnvironmentActionHandler_respondToActions_forFBSScene_fromTransitionContext___block_invoke;
    block[3] = &unk_1E621AFF0;
    v23 = v6;
    dispatch_after(v17, MEMORY[0x1E0C80D38], block);

  }
  bls_scenes_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[BLSBacklightFBSSceneEnvironmentActionHandler respondToActions:forFBSScene:fromTransitionContext:].cold.1(v21);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)desiredFidelityRequestFromAction:(id)a3
{
  id v3;
  BLSDesiredFidelityRequest *v4;
  BLSDesiredFidelityRequest *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (v3)
  {
    v4 = [BLSDesiredFidelityRequest alloc];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke;
    v7[3] = &unk_1E621A498;
    v8 = v3;
    v5 = -[BLSDesiredFidelityRequest initWithCompletion:](v4, "initWithCompletion:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)frameSpecifiersRequestFromAction:(id)a3
{
  id v3;
  BLSFrameSpecifiersRequest *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BLSFrameSpecifiersRequest *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  if (v3)
  {
    v4 = [BLSFrameSpecifiersRequest alloc];
    objc_msgSend(v3, "dateInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "previousPresentationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "shouldReset");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke;
    v10[3] = &unk_1E621AFC8;
    v11 = v3;
    v8 = -[BLSFrameSpecifiersRequest initWithDateInterval:previousPresentationDate:shouldReset:completion:](v4, "initWithDateInterval:previousPresentationDate:shouldReset:completion:", v5, v6, v7, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke(uint64_t a1, uint64_t a2)
{
  void **v3;
  int v4;
  NSObject *v5;
  BLSDesiredFidelityResponse *v6;
  void *v7;

  v3 = (void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 32), "canSendResponse");
  bls_scenes_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (BLSDesiredFidelityResponse *)v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke_cold_1();

    v7 = *v3;
    v6 = -[BLSDesiredFidelityResponse initWithDesiredFidelity:]([BLSDesiredFidelityResponse alloc], "initWithDesiredFidelity:", a2);
    objc_msgSend(v7, "sendResponse:", v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke_cold_2();
  }

}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void **v4;
  void *v5;
  int v6;
  NSObject *v7;
  BLSFrameSpecifiersRequestResponse *v8;
  void *v9;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (void **)(a1 + 32);
  v6 = objc_msgSend(v5, "canSendResponse");
  bls_scenes_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (BLSFrameSpecifiersRequestResponse *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke_cold_1();

    v9 = *v4;
    v8 = -[BLSFrameSpecifiersRequestResponse initWithDateSpecifiers:]([BLSFrameSpecifiersRequestResponse alloc], "initWithDateSpecifiers:", v3);
    objc_msgSend(v9, "sendResponse:", v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke_cold_2();
  }

}

void __99__BLSBacklightFBSSceneEnvironmentActionHandler_respondToActions_forFBSScene_fromTransitionContext___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  NSObject *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v1 = (uint64_t *)(a1 + 32);
  v2 = *(id *)(a1 + 32);
  v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (!v3)
    goto LABEL_16;
  v5 = v3;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  *(_QWORD *)&v4 = 138412290;
  v11 = v4;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
      if (objc_msgSend(v9, "_expectsResponse", v11, (_QWORD)v12)
        && objc_msgSend(v9, "canSendResponse"))
      {
        bls_scenes_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v11;
          v17 = v9;
          _os_log_debug_impl(&dword_1B0C75000, v10, OS_LOG_TYPE_DEBUG, "response failed for action:%@", buf, 0xCu);
        }

        v6 = 1;
      }
    }
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  }
  while (v5);

  if ((v6 & 1) != 0)
  {
    bls_scenes_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __99__BLSBacklightFBSSceneEnvironmentActionHandler_respondToActions_forFBSScene_fromTransitionContext___block_invoke_cold_1(v1, v2);
LABEL_16:

  }
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromBLSUpdateFidelity(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_2(&dword_1B0C75000, v2, v3, "will send desiredFidelity:%{public}@ response to desiredFidelityAction:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_5();
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromBLSUpdateFidelity(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4(&dword_1B0C75000, v2, v3, "unable to send desiredFidelity:%{public}@ response to desiredFidelityAction:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_5();
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v1, "bls_boundedDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_2(&dword_1B0C75000, v2, v3, "will send specifiers:%{public}@ response to frameSpecifiersAction:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_5();
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke_cold_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v1, "bls_boundedDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4(&dword_1B0C75000, v2, v3, "unable to send specifiers:%{public}@ response to frameSpecifiersAction:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_5();
}

- (void)respondToActions:(void *)a1 forFBSScene:fromTransitionContext:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4_3(&dword_1B0C75000, v1, v2, "respondToActions: remaining action count:%ld", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_4();
}

- (void)respondToActions:(void *)a1 forFBSScene:fromTransitionContext:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4_3(&dword_1B0C75000, v1, v2, "respondToActions: start action count:%ld", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_4();
}

void __99__BLSBacklightFBSSceneEnvironmentActionHandler_respondToActions_forFBSScene_fromTransitionContext___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134218242;
  v4 = 0x4014000000000000;
  v5 = 2112;
  v6 = v2;
  _os_log_fault_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_FAULT, "one or more actions did not respond after %lf seconds; %@",
    (uint8_t *)&v3,
    0x16u);
}

@end
