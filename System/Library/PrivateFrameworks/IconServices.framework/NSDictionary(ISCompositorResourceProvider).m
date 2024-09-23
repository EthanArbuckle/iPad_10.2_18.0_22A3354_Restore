@implementation NSDictionary(ISCompositorResourceProvider)

- (id)_IS_resourceNamed:()ISCompositorResourceProvider
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    while (1)
    {
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v6, "containsObject:", v5))
        break;
      objc_msgSend(v6, "addObject:", v5);
      objc_msgSend(a1, "objectForKey:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_8;
      v8 = (void *)v7;

      objc_opt_class();
      v5 = v8;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
    }
    _ISDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1AA928000, v9, OS_LOG_TYPE_DEFAULT, "Content referancince cycle detected name '%@'.", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }
  else
  {
LABEL_8:
    v8 = v5;
  }
LABEL_12:

  return v8;
}

@end
