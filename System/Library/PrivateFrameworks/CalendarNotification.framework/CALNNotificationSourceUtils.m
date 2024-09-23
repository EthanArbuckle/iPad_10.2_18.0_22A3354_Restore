@implementation CALNNotificationSourceUtils

+ (id)displayNameForJunkIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "emailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BE14838], "sharedGenerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "phoneNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "formattedStringForPhoneNumber:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

+ (void)updateSubtitleAndThreadIdentifierOnNotificationContent:(id)a3 forDelegateSourceWithTitle:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[CALNBundle bundle](CALNBundle, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("For %@"), &stru_24D4856D0, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v12, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSubtitle:", v11);
  objc_msgSend(v9, "setThreadIdentifier:", v7);

}

@end
