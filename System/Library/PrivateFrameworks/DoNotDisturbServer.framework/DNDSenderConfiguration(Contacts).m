@implementation DNDSenderConfiguration(Contacts)

- (id)sanitizedConfigurationWithContactStore:()Contacts
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(a1, "allowedContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sanitizeContacts:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "setAllowedContacts:", v8);

  objc_msgSend(a1, "deniedContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sanitizeContacts:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v5, "setDeniedContacts:", v11);

  return v5;
}

@end
