@implementation INHelperServiceAccessSpecifier

- (INHelperServiceAccessSpecifier)initWithAccessLevel:(unint64_t)a3 associatedAppBundleIdentifier:(id)a4
{
  id v6;
  INHelperServiceAccessSpecifier *v7;
  INHelperServiceAccessSpecifier *v8;
  uint64_t v9;
  NSString *associatedAppBundleIdentifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INHelperServiceAccessSpecifier;
  v7 = -[INHelperServiceAccessSpecifier init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_accessLevel = a3;
    v9 = objc_msgSend(v6, "copy");
    associatedAppBundleIdentifier = v8->_associatedAppBundleIdentifier;
    v8->_associatedAppBundleIdentifier = (NSString *)v9;

  }
  return v8;
}

- (id)debugDescription
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v3 = -[INHelperServiceAccessSpecifier accessLevel](self, "accessLevel");
  if (v3 == 2)
  {
    v4 = CFSTR("Unrestricted");
  }
  else if (v3 == 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[INHelperServiceAccessSpecifier associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("FilteredByBundleID=%@"), v6);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = CFSTR("None");
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p %@>"), v9, self, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

+ (id)accessSpecifierUnrestricted
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAccessLevel:associatedAppBundleIdentifier:", 2, 0);
}

+ (id)accessSpecifierFilteredForAssociatedAppBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccessLevel:associatedAppBundleIdentifier:", 1, v4);

  return v5;
}

+ (id)accessSpecifierWithNoAccess
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAccessLevel:associatedAppBundleIdentifier:", 0, 0);
}

+ (id)accessSpecifierAppropriateForCurrentProcess
{
  void *v3;

  if (INThisProcessIsAssistantd_onceToken != -1)
    dispatch_once(&INThisProcessIsAssistantd_onceToken, &__block_literal_global_68956);
  if (INThisProcessIsAssistantd_isAssistantd)
    goto LABEL_10;
  if (INThisProcessIsSiri_onceToken != -1)
    dispatch_once(&INThisProcessIsSiri_onceToken, &__block_literal_global_27);
  if (INThisProcessIsSiri_isSiri)
    goto LABEL_10;
  if (INThisProcessIsCarousel_onceToken != -1)
    dispatch_once(&INThisProcessIsCarousel_onceToken, &__block_literal_global_29);
  if (INThisProcessIsCarousel_isCarousel)
  {
LABEL_10:
    objc_msgSend(a1, "accessSpecifierUnrestricted");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "accessSpecifierWithNoAccess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)accessSpecifierAppropriateForXPCConnection:(id)a3
{
  id v3;
  id v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  _BYTE buffer[4096];
  uint64_t v28;

  MEMORY[0x1E0C80A78](a1, a2);
  v28 = *MEMORY[0x1E0C80C00];
  v4 = v3;
  v5 = objc_msgSend(v4, "processIdentifier");
  bzero(buffer, 0x1000uLL);
  v6 = proc_pidpath(v5, buffer, 0x1000u);
  if (v6 >= 1
    && (v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v6, 4), v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v7, 1), v9 = (void *)_CFBundleCopyBundleURLForExecutableURL(), v8, v7, v9))
  {
    objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        v23 = 136315394;
        v24 = "bundleProxyForPID";
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s No bundleProxy for bundleURL=%{publid}@", (uint8_t *)&v23, 0x16u);
      }
    }

  }
  else
  {
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v23 = 136315394;
      v24 = "bundleProxyForPID";
      v25 = 1024;
      LODWORD(v26) = v5;
      _os_log_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_INFO, "%s No bundleURL for pid=%{publid}d", (uint8_t *)&v23, 0x12u);
    }
    v10 = 0;
  }
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.intents.intents-helper"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "BOOLValue"))
  {
    +[INHelperServiceAccessSpecifier accessSpecifierUnrestricted](INHelperServiceAccessSpecifier, "accessSpecifierUnrestricted");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.intents.extension.discovery"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "BOOLValue")
      || !v10
      || (objc_msgSend(v10, "bundleIdentifier"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.WorkflowUI.AddShortcutExtension")),
          v16,
          v17))
    {
      +[INHelperServiceAccessSpecifier accessSpecifierUnrestricted](INHelperServiceAccessSpecifier, "accessSpecifierUnrestricted");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v10;
      else
        v18 = 0;
      v19 = v18;
      v20 = v19;
      if (v19 && objc_msgSend(v19, "if_isSystem"))
      {
        +[INHelperServiceAccessSpecifier accessSpecifierUnrestricted](INHelperServiceAccessSpecifier, "accessSpecifierUnrestricted");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "bundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          +[INHelperServiceAccessSpecifier accessSpecifierFilteredForAssociatedAppBundleIdentifier:](INHelperServiceAccessSpecifier, "accessSpecifierFilteredForAssociatedAppBundleIdentifier:", v21);
        else
          +[INHelperServiceAccessSpecifier accessSpecifierWithNoAccess](INHelperServiceAccessSpecifier, "accessSpecifierWithNoAccess");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v14;
}

@end
