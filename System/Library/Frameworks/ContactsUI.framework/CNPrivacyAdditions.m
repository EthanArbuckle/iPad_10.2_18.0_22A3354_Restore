@implementation CNPrivacyAdditions

+ (void)updateAccessDeniedView:(id)a3 forAuthorizationStatus:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4 == 1)
  {
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACCESS_DENIED_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    if (a4 != 2)
    {
      v6 = 0;
      v8 = 0;
      goto LABEL_7;
    }
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACCESS_DENIED_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACCESS_DENIED_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  objc_msgSend(v9, "setTitle:", v6);
  objc_msgSend(v9, "setMessage:", v8);

}

@end
