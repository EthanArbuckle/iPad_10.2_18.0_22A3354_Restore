@implementation BPSTapToRadarCoordinator

+ (BOOL)openTapToRadarWithInitialMetadata:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "tapToRadarLaunchURLWithInitialMetadata:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:configuration:completionHandler:", v3, 0, &__block_literal_global_4);

  return 1;
}

void __62__BPSTapToRadarCoordinator_openTapToRadarWithInitialMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    bps_setup_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "Error opening tap-to-radar: %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

+ (id)tapToRadarLaunchURLWithInitialMetadata:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1808];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v5, "setHost:", CFSTR("new"));
  objc_msgSend(v4, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setQueryItems:", v6);
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)tapToRadarUserActivityWithInitialMetadata:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[8];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "tapToRadarLaunchURLWithInitialMetadata:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1598]), "initWithActivityType:", CFSTR("com.apple.Bridge.ttr"));
    objc_msgSend(v5, "setEligibleForSearch:", 0);
    objc_msgSend(v5, "setEligibleForHandoff:", 0);
    objc_msgSend(v5, "setEligibleForPrediction:", 0);
    objc_msgSend(v5, "setEligibleForPublicIndexing:", 0);
    v9 = CFSTR("tap-to-radar");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInfo:", v6);
  }
  else
  {
    bps_setup_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21147E000, v6, OS_LOG_TYPE_DEFAULT, "Error: Tried to generate tap-to-radar NSUserActivity but URL string was malformed", v8, 2u);
    }
    v5 = 0;
  }

  return v5;
}

@end
