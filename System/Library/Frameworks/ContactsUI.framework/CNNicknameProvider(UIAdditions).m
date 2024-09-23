@implementation CNNicknameProvider(UIAdditions)

- (id)sharingAudienceDisplayString
{
  uint64_t v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v1 = objc_msgSend(a1, "sharingAudience");
  if (v1 == 2)
  {
    CNContactsUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("SHARING_AUDIENCE_ALWAYS_ASK");
  }
  else if (v1 == 1)
  {
    CNContactsUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("SHARING_AUDIENCE_CONTACTS_ONLY");
  }
  else
  {
    if (v1)
    {
      v5 = 0;
      return v5;
    }
    CNContactsUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("SHARING_AUDIENCE_EVERYONE");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
