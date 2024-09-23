@implementation CNContactViewController(MessageUI)

+ (id)_mf_viewControllerForUnknownContactWithEmailAddress:()MessageUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v3);
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ec_personNameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97200], "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:", v6, v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
    objc_msgSend(v8, "setPrimaryPropertyKey:", *MEMORY[0x1E0C966A8]);

  return v8;
}

@end
