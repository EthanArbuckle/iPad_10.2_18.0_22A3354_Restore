@implementation CTSubscriberInfo

+ (NSArray)subscribers
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  CTSubscriber *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v19 = 0;
  objc_msgSend(v2, "getDescriptorsForDomain:error:", 1, &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  if (v4)
  {
    v5 = CTLogSubscriber();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CTSubscriberInfo subscribers].cold.1((uint64_t)v4, v5);
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v3, "descriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "descriptors", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = -[CTSubscriber initWithDescriptor:]([CTSubscriber alloc], "initWithDescriptor:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          objc_msgSend(v6, "addObject:", v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

  }
  return (NSArray *)v6;
}

+ (CTSubscriber)subscriber
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "subscribers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (CTSubscriber *)v3;
}

+ (void)subscribers
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18425C000, a2, OS_LOG_TYPE_ERROR, "Unable to get service descriptors: %@", (uint8_t *)&v2, 0xCu);
}

@end
