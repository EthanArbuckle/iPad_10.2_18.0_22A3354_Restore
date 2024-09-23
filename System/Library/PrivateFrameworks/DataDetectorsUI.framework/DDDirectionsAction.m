@implementation DDDirectionsAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Get Directions"));
}

- (id)iconName
{
  return CFSTR("arrow.triangle.turn.up.right.circle");
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

  url = self->super.super._url;
  v4 = self->super.super._result;
  contact = self->super.super._contact;
  -[NSDictionary objectForKeyedSubscript:](self->super.super._context, "objectForKeyedSubscript:", 0x1E4259480);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _displayString(url, (uint64_t)v4, contact, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSURL scheme](self->super.super._url, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("geo"));

    v11 = (void *)MEMORY[0x1E0CB3940];
    if (v10)
      v12 = CFSTR("Get directions to location “%@”");
    else
      v12 = CFSTR("Get directions to “%@”");
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

- (id)notificationURL
{
  __DDResult *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSURL *url;
  NSURL *v11;
  __DDResult *v12;
  CNContact *contact;
  void *v14;
  void *v15;
  uint64_t v17;

  v3 = self->super.super._result;
  if (!v3)
  {
    if (!self->super.super._url)
    {
      DDDefaultAddressForContact(self->super.super._contact);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {

      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](self->super.super._context, "objectForKeyedSubscript:", 0x1E4259480);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5)
          DDUILogAssertionFailure((uint64_t)"_result || _url || DDDefaultAddressForContact(_contact) || _context[kDataDetectorsCachedEventKey]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDAddressActions.m", (uint64_t)"-[DDDirectionsAction notificationURL]", 372, CFSTR("Expecting a result, a URL, a contact with an address or an event with a location"), v6, v7, v8, v17);
      }
    }
    v3 = self->super.super._result;
    if (!v3)
      goto LABEL_9;
  }
  DDDirectionsURLForResult(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_9:
    url = self->super.super._url;
    if (url)
    {
      DDDirectionsURLForURL(url);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        return v9;
      v11 = self->super.super._url;
    }
    else
    {
      v11 = 0;
    }
    v12 = self->super.super._result;
    contact = self->super.super._contact;
    -[NSDictionary objectForKeyedSubscript:](self->super.super._context, "objectForKeyedSubscript:", 0x1E4259480);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _displayString(v11, (uint64_t)v12, contact, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      DDDirectionsURLForString(v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

@end
