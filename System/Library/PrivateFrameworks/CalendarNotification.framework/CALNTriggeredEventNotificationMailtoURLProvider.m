@implementation CALNTriggeredEventNotificationMailtoURLProvider

- (CALNTriggeredEventNotificationMailtoURLProvider)initWithMailAccounts:(id)a3
{
  id v5;
  CALNTriggeredEventNotificationMailtoURLProvider *v6;
  CALNTriggeredEventNotificationMailtoURLProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNTriggeredEventNotificationMailtoURLProvider;
  v6 = -[CALNTriggeredEventNotificationMailtoURLProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mailAccounts, a3);

  return v7;
}

- (id)mailtoURLForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t buf[4];
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "organizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "isCurrentUser"))
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_20:
      v18 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v4, "externalURL");
    v8 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_INFO, "Could not get mailto url for event. Event does not have an organizer that is not the current user. In other words, there is no organizer for this event or the current user is the organizer. event external URL = %{public}@", buf, 0xCu);
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v6, "emailAddress");
  v9 = objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (!v9 || !-[NSObject length](v9, "length"))
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    objc_msgSend(v4, "externalURL");
    v19 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v19;
    v20 = "Could not get mailto url because could not find organizer's email address. event external URL = %{public}@";
    v21 = v8;
    v22 = OS_LOG_TYPE_INFO;
LABEL_18:
    _os_log_impl(&dword_215D9B000, v21, v22, v20, buf, 0xCu);

    goto LABEL_19;
  }
  -[CALNTriggeredEventNotificationMailtoURLProvider mailAccounts](self, "mailAccounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canSendMail");

  if ((v11 & 1) == 0)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    objc_msgSend(v4, "externalURL");
    v19 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v19;
    v20 = "Could not get mailto url because cannot send mail. event external URL = %{public}@";
    v21 = v8;
    v22 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_18;
  }
  objc_msgSend(v4, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12 || !objc_msgSend(v12, "length"))
  {
    +[CALNBundle bundle](CALNBundle, "bundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Email sender unknown title"), CFSTR("Event"), 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  if (mailtoURLForEvent__onceToken != -1)
    dispatch_once(&mailtoURLForEvent__onceToken, &__block_literal_global_9);
  objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", mailtoURLForEvent__allowedCharacters);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mailto:%@?subject=%@"), v7, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v18;
}

void __69__CALNTriggeredEventNotificationMailtoURLProvider_mailtoURLForEvent___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("/?&:$+,;=@"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)mailtoURLForEvent__allowedCharacters;
  mailtoURLForEvent__allowedCharacters = v1;

}

- (CALNMailAccounts)mailAccounts
{
  return self->_mailAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailAccounts, 0);
}

@end
