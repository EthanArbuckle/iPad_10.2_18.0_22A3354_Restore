@implementation _CDInteractionHarvester

- (id)harvestInteractionsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *context;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  context = (void *)MEMORY[0x193FEE914]();
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_CDInteractionHarvester harvestInteractionsBetweenStartDate:endDate:].cold.3(v5, v6, v7);

  +[_CDSpotlightItemUtils querySpotlightItemsWithStartDate:endDate:getMail:getMessages:](_CDSpotlightItemUtils, "querySpotlightItemsWithStartDate:endDate:getMail:getMessages:", v5, v6, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_CDInteractionHarvester harvestInteractionsBetweenStartDate:endDate:].cold.2(v8);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSUserName();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:](_CDSpotlightItemUtils, "interactionForSearchableItem:nsUserName:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v10, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[_CDInteractionHarvester harvestInteractionsBetweenStartDate:endDate:].cold.1(v10);

  objc_autoreleasePoolPop(context);
  return v10;
}

- (void)harvestInteractionsBetweenStartDate:(void *)a1 endDate:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%lu items were valid interactions", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)harvestInteractionsBetweenStartDate:(void *)a1 endDate:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "Converting %lu items into interactions", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)harvestInteractionsBetweenStartDate:(NSObject *)a3 endDate:.cold.3(void *a1, void *a2, NSObject *a3)
{
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "timeIntervalSinceNow");
  v6 = v5 / -86400.0;
  objc_msgSend(a2, "timeIntervalSinceNow");
  v8 = 134218240;
  v9 = v6;
  v10 = 2048;
  v11 = v7 / -86400.0;
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "Harvesting Mail and Message data between %2.1f  and %2.1f  days ago", (uint8_t *)&v8, 0x16u);
}

@end
