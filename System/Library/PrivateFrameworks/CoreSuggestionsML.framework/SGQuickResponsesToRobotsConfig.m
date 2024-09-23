@implementation SGQuickResponsesToRobotsConfig

- (SGQuickResponsesToRobotsConfig)initWithDictionary:(id)a3
{
  id v5;
  SGQuickResponsesToRobotsConfig *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *supportedKeysAndContext;
  id v10;
  void *v11;
  uint64_t v12;
  NSSet *triggerWords;
  id v14;
  void *v15;
  uint64_t v16;
  NSSet *generalContextWords;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  void *v29;
  objc_super v30;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesToRobotsConfig.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("params"));

  }
  v30.receiver = self;
  v30.super_class = (Class)SGQuickResponsesToRobotsConfig;
  v6 = -[SGQuickResponsesToRobotsConfig init](&v30, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ENABLE_FEATURE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_enableFeature = objc_msgSend(v7, "BOOLValue");

    if (v6->_enableFeature)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RULES_DICT"));
      v8 = objc_claimAutoreleasedReturnValue();
      supportedKeysAndContext = v6->_supportedKeysAndContext;
      v6->_supportedKeysAndContext = (NSDictionary *)v8;

      v10 = objc_alloc(MEMORY[0x24BDBCF20]);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TRIGGER_WORDS"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithArray:", v11);
      triggerWords = v6->_triggerWords;
      v6->_triggerWords = (NSSet *)v12;

      v14 = objc_alloc(MEMORY[0x24BDBCF20]);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GENERAL_CONTEXT_WORDS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithArray:", v15);
      generalContextWords = v6->_generalContextWords;
      v6->_generalContextWords = (NSSet *)v16;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LEFT_CONTEXT"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_leftContext = objc_msgSend(v18, "unsignedIntValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RIGHT_CONTEXT"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_rightContext = objc_msgSend(v19, "unsignedIntValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GENERAL_CONTEXT_LEFT"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_generalContextLeft = objc_msgSend(v20, "unsignedIntValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GENERAL_CONTEXT_RIGHT"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_generalContextRight = objc_msgSend(v21, "unsignedIntValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TRIGGER_CONTEXT"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_triggerContext = objc_msgSend(v22, "unsignedIntValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RELAX_CONTEXT"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_relaxContext = objc_msgSend(v23, "BOOLValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("USE_GENERAL_CONTEXT"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_useGeneralContext = objc_msgSend(v24, "BOOLValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("INSIGNIFICANT_SENDER"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_insignificantSender = objc_msgSend(v25, "BOOLValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAPS_WORDS_RATIO_MAX"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "floatValue");
      v6->_capsWordsRatioMax = v27;

    }
  }

  return v6;
}

- (NSDictionary)supportedKeysAndContext
{
  return self->_supportedKeysAndContext;
}

- (NSSet)generalContextWords
{
  return self->_generalContextWords;
}

- (NSSet)triggerWords
{
  return self->_triggerWords;
}

- (unint64_t)leftContext
{
  return self->_leftContext;
}

- (unint64_t)rightContext
{
  return self->_rightContext;
}

- (unint64_t)generalContextLeft
{
  return self->_generalContextLeft;
}

- (unint64_t)generalContextRight
{
  return self->_generalContextRight;
}

- (unint64_t)triggerContext
{
  return self->_triggerContext;
}

- (BOOL)enableFeature
{
  return self->_enableFeature;
}

- (BOOL)relaxContext
{
  return self->_relaxContext;
}

- (BOOL)useGeneralContext
{
  return self->_useGeneralContext;
}

- (BOOL)insignificantSender
{
  return self->_insignificantSender;
}

- (float)capsWordsRatioMax
{
  return self->_capsWordsRatioMax;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerWords, 0);
  objc_storeStrong((id *)&self->_generalContextWords, 0);
  objc_storeStrong((id *)&self->_supportedKeysAndContext, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1040);
  return (id)sharedInstance__sharedConfig;
}

void __48__SGQuickResponsesToRobotsConfig_sharedInstance__block_invoke()
{
  void *v0;
  SGQuickResponsesToRobotsConfig *v1;
  void *v2;
  uint8_t v3[16];

  +[SGDefaultAssets responseToRobotParams](SGDefaultAssets, "responseToRobotParams");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = -[SGQuickResponsesToRobotsConfig initWithDictionary:]([SGQuickResponsesToRobotsConfig alloc], "initWithDictionary:", v0);
    v2 = (void *)sharedInstance__sharedConfig;
    sharedInstance__sharedConfig = (uint64_t)v1;

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Responses to Robots config file not found", v3, 2u);
  }

}

@end
