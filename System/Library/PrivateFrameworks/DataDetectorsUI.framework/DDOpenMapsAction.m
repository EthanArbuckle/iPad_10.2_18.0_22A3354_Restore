@implementation DDOpenMapsAction

+ (BOOL)actionAvailableForContact:(id)a3
{
  void *v3;
  BOOL v4;

  _displayString(0, 0, a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

+ (BOOL)actionAvailableForCachedEvent:(id)a3
{
  void *v3;
  BOOL v4;

  _displayString(0, 0, 0, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Open in Maps"));
}

- (id)iconName
{
  return CFSTR("map");
}

- (id)variantIconName
{
  return CFSTR("location.fill");
}

- (id)compactTitle
{
  NSURL *url;
  __DDResult *v4;
  CNContact *contact;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  url = self->super._url;
  v4 = self->super._result;
  contact = self->super._contact;
  -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", 0x1E4259480);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _displayString(url, (uint64_t)v4, contact, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DDOpenMapsAction;
    -[DDAction compactTitle](&v11, sel_compactTitle);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)notificationTitle
{
  NSURL *url;
  __DDResult *v4;
  CNContact *contact;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  url = self->super._url;
  v4 = self->super._result;
  contact = self->super._contact;
  -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", 0x1E4259480);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _displayString(url, (uint64_t)v4, contact, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSURL scheme](self->super._url, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("geo"));

    v11 = (void *)MEMORY[0x1E0CB3940];
    if (v10)
      v12 = CFSTR("View location “%@” in Maps");
    else
      v12 = CFSTR("View “%@” in Maps");
    DDLocalizedString(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v14, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)notificationIconBundleIdentifier
{
  return CFSTR("com.apple.Maps");
}

- (id)notificationURL
{
  __DDResult *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __DDResult *v11;
  NSURL *url;
  NSURL *v13;
  CNContact *contact;
  void *v15;
  void *v16;
  uint64_t v18;

  v3 = self->super._result;
  if (v3)
    goto LABEL_8;
  if (!self->super._url)
  {
    DDDefaultAddressForContact(self->super._contact);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", 0x1E4259480);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("event"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        DDUILogAssertionFailure((uint64_t)"_result || _url || DDDefaultAddressForContact(_contact) || _context[kDataDetectorsCachedEventKey][@\"event\"]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDAddressActions.m", (uint64_t)"-[DDOpenMapsAction notificationURL]", 310, CFSTR("Expecting a result, a URL, a contact with an address or an event with a location"), v7, v8, v9, v18);
    }
  }
  v3 = self->super._result;
  if (v3)
  {
LABEL_8:
    DDMapURLForResult(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      return v10;
    v11 = self->super._result;
  }
  else
  {
    v11 = 0;
  }
  url = self->super._url;
  if (url)
  {
    DDMapsURLForUrlAndResult(url, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      return v10;
    v13 = self->super._url;
    v11 = self->super._result;
  }
  else
  {
    v13 = 0;
  }
  contact = self->super._contact;
  -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", 0x1E4259480);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _displayString(v13, (uint64_t)v11, contact, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    DDMapURLForString(v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)performFromView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DDOpenMapsAction notificationURL](self, "notificationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[DDAction addToRecents](self, "addToRecents");
    -[DDAction _performFromView:byOpeningURL:](self, "_performFromView:byOpeningURL:", v5, v4);
  }

}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

@end
