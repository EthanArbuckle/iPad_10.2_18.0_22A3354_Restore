@implementation PRSPosterConfiguration(AmbientUI)

- (NSObject)amui_getConfiguredDisplayNameWithError:()AmbientUI
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  int v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "pr_loadOtherMetadataWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "displayNameLocalizationKey");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      AMUILogSwitcher();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:].cold.5((uint64_t)a1, v8, v9, v10, v11, v12, v13, v14);

    }
    objc_msgSend(a1, "pr_posterProvider");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v15, a3);
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v16, "URL");
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDC8]), "initWithURL:", v18);
        v20 = v19;
        if (v19)
        {
          objc_msgSend(v19, "localizedStringForKey:value:table:", v7, 0, 0);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            v22 = v21;
            v23 = v22;
          }
          else
          {
            AMUILogSwitcher();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v32 = 138412802;
              v33 = v7;
              v34 = 2112;
              v35 = v20;
              v36 = 2112;
              v37 = a1;
              _os_log_error_impl(&dword_23600A000, v30, OS_LOG_TYPE_ERROR, "Failed to load display name localization key \"%@\" from bundle %@ for %@", (uint8_t *)&v32, 0x20u);
            }

            v23 = 0;
          }
        }
        else
        {
          AMUILogSwitcher();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:].cold.4();
          v23 = 0;
        }

        goto LABEL_29;
      }
      AMUILogSwitcher();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:].cold.3();
    }
    else
    {
      AMUILogSwitcher();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:].cold.2((uint64_t)a1, v18, v24, v25, v26, v27, v28, v29);
    }
    v23 = 0;
LABEL_29:

    goto LABEL_30;
  }
  if (a3)
    v7 = *a3;
  else
    v7 = 0;
  AMUILogSwitcher();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:].cold.1();
  v23 = 0;
LABEL_30:

  return v23;
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23600A000, v0, v1, "Unable to load metadata for poster configuration %@: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_23600A000, a2, a3, "Missing poster provider from configuration %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23600A000, v0, v1, "No extension record for provider %@ configuration %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23600A000, v0, v1, "Failed to load bundle %@ from %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_23600A000, a2, a3, "No display name localization key for configuration %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
