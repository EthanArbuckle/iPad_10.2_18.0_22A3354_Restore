@implementation ATXClientModelPredictionReasons

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (ATXClientModelPredictionReasons)init
{
  ATXClientModelPredictionReasons *v2;
  void *v3;
  uint64_t v4;
  NSBundle *bundle;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXClientModelPredictionReasons;
  v2 = -[ATXClientModelPredictionReasons init](&v7, sel_init);
  if (v2)
  {
    +[ATXClientModelPredictionReasons clientModelPredictionReasonsBundlePath](ATXClientModelPredictionReasons, "clientModelPredictionReasonsBundlePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      bundle = v2->_bundle;
      v2->_bundle = (NSBundle *)v4;
    }
    else
    {
      bundle = v2->_bundle;
      v2->_bundle = 0;
    }

  }
  return v2;
}

+ (id)clientModelPredictionReasonsBundlePath
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("ATXClientModelPredictionReasons"), &stru_1E82FDC98, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ATXClientModelPredictionReasons clientModelPredictionReasonsBundlePath].cold.1(v5);

  }
  return v3;
}

- (id)localizedStringForKey:(id)a3
{
  return -[NSBundle localizedStringForKey:value:table:](self->_bundle, "localizedStringForKey:value:table:", a3, 0, CFSTR("ATXClientModelPredictionReasons"));
}

- (id)appInstalledAppClipReason
{
  return -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", CFSTR("App_InstalledAppClip"));
}

- (id)appLocationBasedAppClipReason
{
  return -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", CFSTR("App_LocationBasedAppClip"));
}

- (id)appHeroAppReason
{
  return -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", CFSTR("App_HeroApp"));
}

- (id)appMagicalMomentReasonForAnchorType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D810C0], "predictedAnchorTypeToString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("App_MagicalMoment_%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)appAnchorReasonForAnchorType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("App_Anchor_%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appBehavioralReason
{
  return -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", CFSTR("App_Behavioral"));
}

- (id)actionBehavioralReason
{
  return -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", CFSTR("Action_Behavioral"));
}

- (id)actionHeuristicReasonForHeuristicName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Action_Heuristic_%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)actionAnchorReasonForAnchorType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Action_Anchor_%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXClientModelPredictionReasons localizedStringForKey:](self, "localizedStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)clientModelPredictionReasonsBundlePath
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXClientModelPredictionReasons Bundle doesn't exist!", v1, 2u);
}

@end
