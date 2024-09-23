@implementation _SFBrowserConfiguration

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_configuration == 1;
}

- (BOOL)isControlledByAutomation
{
  return self->_configuration == 2;
}

- (int64_t)barTintStyle
{
  id WeakRetained;
  void *v4;
  int64_t configuration;
  void *v6;
  unint64_t v7;
  _QWORD *v8;
  void *v9;
  int64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_traitEnvironment);
  v4 = WeakRetained;
  configuration = self->_configuration;
  if (configuration == 1)
    goto LABEL_5;
  if (configuration)
    goto LABEL_8;
  objc_msgSend(WeakRetained, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v7 >= 3)
  {
LABEL_5:
    objc_msgSend(v4, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "userInterfaceStyle");

    if (v7 < 3)
    {
      v8 = &unk_1A3CB11A0;
      goto LABEL_7;
    }
LABEL_8:
    v10 = 5;
    goto LABEL_9;
  }
  v8 = &unk_1A3CB1188;
LABEL_7:
  v10 = v8[v7];
LABEL_9:

  return v10;
}

- (BOOL)allowsSpeculativeLoading
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_traitEnvironment);
}

- (_SFBrowserConfiguration)initWithPrivateBrowsingEnabled:(BOOL)a3 traitEnvironment:(id)a4 controlledByAutomation:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  _SFBrowserConfiguration *v8;
  uint64_t v9;
  objc_super v11;

  v5 = a5;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFBrowserConfiguration;
  v7 = a4;
  v8 = -[_SFBrowserConfiguration init](&v11, sel_init);
  objc_storeWeak((id *)&v8->_traitEnvironment, v7);

  v9 = 2;
  if (!v5)
    v9 = 0;
  if (v6)
    v9 = 1;
  v8->_configuration = v9;
  return v8;
}

- (BOOL)usesPersistentDataStore
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsSearchFeedback
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsRestoringEducationTabs
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsNetworkedSearchSuggestions
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsKeyboardCorrectionLearning
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (UITraitEnvironment)traitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_traitEnvironment);
}

- (BOOL)isEqual:(id)a3
{
  _SFBrowserConfiguration *v4;
  _SFBrowserConfiguration *v5;
  BOOL v6;

  v4 = (_SFBrowserConfiguration *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) && self->_configuration == v5->_configuration;

  return v6;
}

- (unint64_t)hash
{
  return 0x5555555555555555 * self->_configuration;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t configuration;
  const __CFString *v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  configuration = self->_configuration;
  v6 = CFSTR("default");
  if (configuration == 1)
    v6 = CFSTR("private");
  if (configuration == 2)
    v7 = CFSTR("automation");
  else
    v7 = v6;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v4, self, v7);
}

- (BOOL)allowsSiteSpecificSearch
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsStreamlinedLogin
{
  return self->_configuration != 2;
}

- (BOOL)allowsUserActivityFeedback
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsPersistingTabState
{
  return self->_configuration != 2;
}

- (BOOL)allowsReopeningClosedTabs
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)usesDarkTheme
{
  -[_SFBrowserConfiguration barTintStyle](self, "barTintStyle");
  return _SFIsDarkTintStyle();
}

@end
