@implementation DDSendMailAction

+ (id)matchingScheme
{
  return CFSTR("mailto");
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("New Mail Message"));
}

- (id)iconName
{
  return CFSTR("envelope");
}

- (id)compactTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSURL dd_emailFromMailtoScheme](self->super._url, "dd_emailFromMailtoScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dd_userFriendlyEmail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDAction displayNameForEmails:phoneNumbers:](self, "displayNameForEmails:phoneNumbers:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
      v7 = v6;
    else
      v7 = v4;
    v8 = v7;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DDSendMailAction;
    -[DDAction compactTitle](&v10, sel_compactTitle);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)notificationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[NSURL dd_emailFromMailtoScheme](self->super._url, "dd_emailFromMailtoScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dd_userFriendlyEmail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDAction displayNameForEmails:phoneNumbers:](self, "displayNameForEmails:phoneNumbers:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "length");
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (v7)
    {
      DDLocalizedString(CFSTR("Compose an email to %@ (%@) in Mail"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v6, v4);
    }
    else
    {
      DDLocalizedString(CFSTR("Compose an email to “%@” in Mail"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v4, v12);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)notificationIconBundleIdentifier
{
  return CFSTR("com.apple.mobilemail");
}

- (id)notificationURL
{
  return self->super._url;
}

- (int)interactionType
{
  return 0;
}

- (void)performFromView:(id)a3
{
  -[DDAction _performFromView:byOpeningURL:](self, "_performFromView:byOpeningURL:", a3, self->super._url);
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

@end
