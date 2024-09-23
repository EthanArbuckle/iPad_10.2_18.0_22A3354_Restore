@implementation SUUIHandleRulesSettingsHeaderFooterDescription

- (SUUIHandleRulesSettingsHeaderFooterDescription)initWithClientContext:(id)a3
{
  id v5;
  SUUIHandleRulesSettingsHeaderFooterDescription *v6;
  SUUIHandleRulesSettingsHeaderFooterDescription *v7;

  v5 = a3;
  v6 = -[SUUIHandleRulesSettingsHeaderFooterDescription init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientContext, a3);

  return v7;
}

- (id)text
{
  SUUIClientContext *clientContext;

  clientContext = self->_clientContext;
  if (clientContext)
    -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_HANDLE_RULES"), CFSTR("Settings"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_HANDLE_RULES"), 0, CFSTR("Settings"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)showInvalid
{
  return self->_showInvalid;
}

- (void)setShowInvalid:(BOOL)a3
{
  self->_showInvalid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
