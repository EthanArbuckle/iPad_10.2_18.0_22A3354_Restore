@implementation FPCheckEnvironmentVariablesAndDefaultsForConfiguration

void ___FPCheckEnvironmentVariablesAndDefaultsForConfiguration_block_invoke()
{
  NSObject *v0;
  char *v1;
  double v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  _BOOL4 v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  char *v20;
  uint64_t v21;
  void *v22;
  double v23;
  NSObject *v24;
  int v25;
  int v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  int v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  _fpConfigurationHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    LOWORD(v39) = 0;
    _os_signpost_emit_with_name_impl(&dword_23C4DA000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CheckingFramePacingConfiguration", "Checking environment variables and/or defaults for non-default FramePacing configuration. Environment variables take precedence.", (uint8_t *)&v39, 2u);
  }

  v1 = getenv("FRAMEPACING_AGGREGATION_WINDOW_IN_SECONDS");
  if (!v1)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", kFPAggregationIntervalSecondsDefaultsVariableName);
    v7 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)&v7, "doubleValue");
      v9 = v8;
      _fpConfigurationHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_signpost_enabled(v10);
      if (v9 > 0.0)
      {
        if (v11)
        {
          objc_msgSend(*(id *)&v7, "doubleValue");
          v39 = 134349056;
          v40 = v12;
          _os_signpost_emit_with_name_impl(&dword_23C4DA000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AggregationWindowConfiguration", "Aggregation window from environment variable: %{public, name=aggregation_window_seconds}f", (uint8_t *)&v39, 0xCu);
        }

        v13 = *(id *)&v7;
LABEL_26:

        if (!v13)
          goto LABEL_30;
        goto LABEL_27;
      }
      if (v11)
      {
        objc_msgSend(*(id *)&v7, "doubleValue");
        v39 = 134349056;
        v40 = v15;
        v14 = "Invalid defaults-based aggregation window value: %{public, name=invalid_aggregation_window_seconds}f";
        goto LABEL_24;
      }
    }
    else
    {
      _fpConfigurationHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        v39 = 138543362;
        v40 = v7;
        v14 = "Invalid defaults-based aggregation window value: %{public, name=invalid_aggregation_window_seconds}@";
LABEL_24:
        _os_signpost_emit_with_name_impl(&dword_23C4DA000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AggregationWindowConfigurationError", v14, (uint8_t *)&v39, 0xCu);
      }
    }

    v13 = 0;
    goto LABEL_26;
  }
  v2 = strtod(v1, 0);
  _fpConfigurationHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_enabled(v3);
  if (v2 < 0.1 || v2 > 20.0)
  {
    if (v4)
    {
      v39 = 134349056;
      v40 = v2;
      _os_signpost_emit_with_name_impl(&dword_23C4DA000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AggregationWindowConfigurationError", "Invalid aggregation window from environment variable: %{public, name=invalid_aggregation_window_seconds}f. Checking defaults...", (uint8_t *)&v39, 0xCu);
    }

    goto LABEL_11;
  }
  if (v4)
  {
    v39 = 134349056;
    v40 = v2;
    _os_signpost_emit_with_name_impl(&dword_23C4DA000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AggregationWindowConfiguration", "Aggregation window from environment variable: %{public, name=aggregation_window_seconds}f", (uint8_t *)&v39, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
LABEL_27:
    v16 = _FPGetCurrentAggregationIntervalSeconds();
    objc_msgSend(v13, "doubleValue");
    v18 = _FPConfigurationSetAggregationInterval(v17);
    _fpConfigurationHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      v39 = 134349312;
      v40 = v16;
      v41 = 2050;
      v42 = v18;
      _os_signpost_emit_with_name_impl(&dword_23C4DA000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UpdatedAggregationInterval", "Updated aggregation window %{public, name=previous_window_sec}.3fsec -> %{public, name=new_window_sec}.3fsec", (uint8_t *)&v39, 0x16u);
    }

  }
LABEL_30:

  v20 = getenv("FRAMEPACING_PER_DRAWABLE_SIGNPOSTS");
  if (v20)
  {
    v21 = strtol(v20, 0, 0);
    v22 = (void *)MEMORY[0x24BDBD1C8];
    if (!v21)
      v22 = (void *)MEMORY[0x24BDBD1C0];
    v23 = COERCE_DOUBLE(v22);
    _fpConfigurationHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      v25 = objc_msgSend(*(id *)&v23, "BOOLValue");
      v39 = 67240192;
      LODWORD(v40) = v25;
      _os_signpost_emit_with_name_impl(&dword_23C4DA000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PerDrawableSignpostConfiguration", "Per-drawable signpost configured via environment variable: %{public, name=per_drawable_signpost_enabled}u", (uint8_t *)&v39, 8u);
    }

    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKey:", kFPEnableDrawableSignpostingDefaultsVariableName);
  v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _fpConfigurationHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v28))
    {
      v39 = 138543362;
      v40 = v23;
      v31 = "PerDrawableSignpostConfigurationError";
      v32 = "Invalid default value type: %{public, name=per_drawable_signpost_enabled}@";
      v33 = v28;
      v34 = 12;
LABEL_50:
      _os_signpost_emit_with_name_impl(&dword_23C4DA000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v31, v32, (uint8_t *)&v39, v34);
    }
LABEL_51:

    return;
  }
  v36 = objc_msgSend(*(id *)&v23, "BOOLValue");
  _fpConfigurationHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v37))
  {
    v39 = 67240192;
    LODWORD(v40) = v36;
    _os_signpost_emit_with_name_impl(&dword_23C4DA000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PerDrawableSignpostConfiguration", "Per-drawable signpost configured via 'FramePacingPerDrawableSignposts' default: %{public, name=per_drawable_signpost_enabled}u", (uint8_t *)&v39, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v36);
  v38 = objc_claimAutoreleasedReturnValue();

  v23 = *(double *)&v38;
  if (v38)
  {
LABEL_36:
    v26 = _FPGetCurrentPerDrawableSignpostingEnabled();
    v27 = _FPConfigurationSetPerDrawableSignpostingEnabled(objc_msgSend(*(id *)&v23, "BOOLValue"));
    _fpConfigurationHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v28))
    {
      *(double *)&v29 = COERCE_DOUBLE("NO");
      if (v26)
        *(double *)&v30 = COERCE_DOUBLE("YES");
      else
        *(double *)&v30 = COERCE_DOUBLE("NO");
      if (v27)
        *(double *)&v29 = COERCE_DOUBLE("YES");
      v39 = 136446466;
      v40 = *(double *)&v30;
      v41 = 2082;
      v42 = *(double *)&v29;
      v31 = "UpdatedPerDrawableSignpostingEnabled";
      v32 = "Updated per-drawable signposting: %{public, name=previous_per_drawable_signposts_enabled}s -> %{public, name"
            "=updated_per_drawable_signposts_enabled}s";
      v33 = v28;
      v34 = 22;
      goto LABEL_50;
    }
    goto LABEL_51;
  }
}

@end
