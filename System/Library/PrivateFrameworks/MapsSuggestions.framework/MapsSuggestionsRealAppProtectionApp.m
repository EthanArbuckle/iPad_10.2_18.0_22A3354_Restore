@implementation MapsSuggestionsRealAppProtectionApp

- (id)_initWithBundleID:(id)a3
{
  id v4;
  MapsSuggestionsRealAppProtectionApp *v5;
  uint64_t v6;
  APApplication *app;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsRealAppProtectionApp;
  v5 = -[MapsSuggestionsRealAppProtectionApp init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    app = v5->_app;
    v5->_app = (APApplication *)v6;

  }
  return v5;
}

- (BOOL)isHidden
{
  return -[APApplication isHidden](self->_app, "isHidden");
}

- (BOOL)isLocked
{
  return -[APApplication isLocked](self->_app, "isLocked");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app, 0);
}

@end
