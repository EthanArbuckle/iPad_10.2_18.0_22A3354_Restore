@implementation _ICSearchContext

- (_ICSearchContext)initWithLocale:(id)a3 recipients:(id)a4 applicationBundleIdentifier:(id)a5 isResponseContextDenylisted:(BOOL)a6 shouldDisableAutoCaps:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  _ICSearchContext *v16;
  _ICSearchContext *v17;
  uint64_t v18;
  NSArray *recipients;
  uint64_t v20;
  NSArray *v21;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_ICSearchContext;
  v16 = -[_ICSearchContext init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_locale, a3);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    recipients = v17->_recipients;
    v17->_recipients = (NSArray *)v18;

    v20 = objc_msgSend(v14, "copy");
    v21 = v17->_recipients;
    v17->_recipients = (NSArray *)v20;

    objc_storeStrong((id *)&v17->_applicationBundleIdentifier, a5);
    v17->_isResponseContextDenylisted = a6;
    v17->_shouldDisableAutoCaps = a7;
  }

  return v17;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (BOOL)isResponseContextDenylisted
{
  return self->_isResponseContextDenylisted;
}

- (BOOL)shouldDisableAutoCaps
{
  return self->_shouldDisableAutoCaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
