@implementation FCNewsTabiUnloadGraphOnBackgroundConfiguration

- (FCNewsTabiUnloadGraphOnBackgroundConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiUnloadGraphOnBackgroundConfiguration *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  id v8;
  void *v9;
  _QWORD v11[5];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCNewsTabiUnloadGraphOnBackgroundConfiguration;
  v5 = -[FCNewsTabiUnloadGraphOnBackgroundConfiguration init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__FCNewsTabiUnloadGraphOnBackgroundConfiguration_initWithDictionary___block_invoke;
    v11[3] = &unk_1E463AB90;
    v8 = v4;
    v11[4] = v8;
    v5->_enabled = __69__FCNewsTabiUnloadGraphOnBackgroundConfiguration_initWithDictionary___block_invoke((uint64_t)v11);
    FCAppConfigurationNumberValue(v8, (uint64_t)CFSTR("graphIdleDuration"), &unk_1E470A9D0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_graphIdleDuration = objc_msgSend(v9, "integerValue");

  }
  return v5;
}

uint64_t __69__FCNewsTabiUnloadGraphOnBackgroundConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (!NFInternalBuild())
    return FCAppConfigurationBoolValue(*(void **)(a1 + 32), (uint64_t)CFSTR("enabled"), 1);
  NewsCoreUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("news.features.tabiBackgroundUnloading"));

  if (v3 != 1)
  {
    if (v3 == 2)
      return 0;
    return FCAppConfigurationBoolValue(*(void **)(a1 + 32), (uint64_t)CFSTR("enabled"), 1);
  }
  return 1;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tenabled: %d;"),
    -[FCNewsTabiUnloadGraphOnBackgroundConfiguration enabled](self, "enabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tgraphIdleDuration: %lu"), -[FCNewsTabiUnloadGraphOnBackgroundConfiguration graphIdleDuration](self, "graphIdleDuration"));
  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)graphIdleDuration
{
  return self->_graphIdleDuration;
}

- (void)setGraphIdleDuration:(int64_t)a3
{
  self->_graphIdleDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
