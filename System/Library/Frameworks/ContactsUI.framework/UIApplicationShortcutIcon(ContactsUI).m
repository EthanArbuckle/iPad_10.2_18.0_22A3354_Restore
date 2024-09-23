@implementation UIApplicationShortcutIcon(ContactsUI)

+ (id)iconWithContact:()ContactsUI
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "hasBeenPersisted");
  v6 = objc_alloc(MEMORY[0x1E0DAAD90]);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v6, "initWithContactIdentifier:", v7);
  }
  else
  {
    objc_msgSend(v4, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v6, "initWithFirstName:lastName:", v7, v9);
  }

  v10 = (void *)objc_msgSend([a1 alloc], "initWithSBSApplicationShortcutIcon:", v8);
  return v10;
}

@end
