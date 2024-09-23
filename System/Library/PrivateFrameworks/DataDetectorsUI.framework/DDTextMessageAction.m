@implementation DDTextMessageAction

+ (id)matchingScheme
{
  return CFSTR("sms");
}

+ (BOOL)isShowMessageURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("sms")))
  {
    objc_msgSend(v3, "resourceSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("?"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("open"));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  char IsChatBot;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_7;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("sms")) & 1) != 0)
  {
LABEL_6:
    v7 = 1;
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("sip")))
  {
    objc_msgSend(v3, "dd_emailFromMailtoScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsChatBot = dd_handleIsChatBot(v8);

    if ((IsChatBot & 1) != 0)
      goto LABEL_6;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v11 = 0;
  v6 = (id)objc_msgSend(v3, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, &v11, 0);
  v7 = v11 != 0;
LABEL_8:

  return v7;
}

- (DDTextMessageAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  NSURL *v8;
  DDTextMessageAction *v9;
  DDTextMessageAction *v10;
  NSURL *url;
  NSURL *v12;
  NSURL *v13;
  void *v14;
  void *phoneNumber;
  int IsChatBot;
  uint64_t v17;
  NSString *serviceID;
  uint64_t v19;
  objc_super v21;

  v8 = (NSURL *)a3;
  v21.receiver = self;
  v21.super_class = (Class)DDTextMessageAction;
  v9 = -[DDTelephoneNumberAction initWithURL:result:context:](&v21, sel_initWithURL_result_context_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    url = v9->super.super._url;
    if (url)
    {
      v12 = url;
    }
    else
    {
      _DDURLFromResult((uint64_t)a4);
      v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    -[NSURL scheme](v13, "scheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    phoneNumber = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(phoneNumber, "isEqualToString:", CFSTR("mailto")))
      goto LABEL_9;
    IsChatBot = dd_handleIsChatBot(v10->super._phoneNumber);

    if (IsChatBot)
    {
      -[NSString dd_encodedEmail](v10->super._phoneNumber, "dd_encodedEmail");
      v17 = objc_claimAutoreleasedReturnValue();
      serviceID = v10->super._serviceID;
      v10->super._serviceID = (NSString *)v17;

      -[NSString componentsSeparatedByString:](v10->super._serviceID, "componentsSeparatedByString:", CFSTR("@"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v19 = objc_claimAutoreleasedReturnValue();
      phoneNumber = v10->super._phoneNumber;
      v10->super._phoneNumber = (NSString *)v19;
LABEL_9:

    }
  }
  else
  {
    v13 = v8;
  }

  return v10;
}

- (id)localizedName
{
  void *v3;
  void *v4;
  void *v5;

  -[DDTelephoneNumberAction bizItem](self, "bizItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DDTelephoneNumberAction bizItem](self, "bizItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    DDLocalizedString(CFSTR("Send Message"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)subtitle
{
  void *v2;
  void *v3;

  -[DDTelephoneNumberAction bizItem](self, "bizItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iconName
{
  return CFSTR("message");
}

- (BOOL)prefersOpenToCreate
{
  return -[NSString isEqualToString:](self->super._phoneNumber, "isEqualToString:", CFSTR("open"));
}

- (int)interactionType
{
  void *v3;
  void *v4;
  double v5;
  int v6;
  double Helper_x8__OBJC_CLASS___MFMessageComposeViewController;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileSMS.MessagesNotificationExtension")) & 1) != 0
    || -[DDTextMessageAction prefersOpenToCreate](self, "prefersOpenToCreate"))
  {
    v6 = 0;
  }
  else
  {
    Helper_x8__OBJC_CLASS___MFMessageComposeViewController = gotLoadHelper_x8__OBJC_CLASS___MFMessageComposeViewController(v5);
    if (objc_msgSend(*(id *)(v8 + 2248), "canSendText", Helper_x8__OBJC_CLASS___MFMessageComposeViewController))v6 = 2;
    else
      v6 = 0;
  }

  return v6;
}

- (id)notificationTitle
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;

  v3 = self->super._phoneNumber;
  if (-[DDTextMessageAction prefersOpenToCreate](self, "prefersOpenToCreate"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    DDLocalizedString(CFSTR("Show in Messages"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:](self, "contactAndLabelForPhoneNumber:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        v8 = v7;

        v3 = v8;
      }

    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    DDLocalizedString(CFSTR("Compose a message to “%@” in Messages"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)notificationIconBundleIdentifier
{
  return CFSTR("com.apple.MobileSMS");
}

- (id)notificationURL
{
  void *v3;
  void *v4;
  NSURL *v5;
  void *v6;
  void *v7;
  NSURL *v8;
  void *v9;
  NSString *body;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[DDTelephoneNumberAction bizItem](self, "bizItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messagesOpenURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[NSURL scheme](self->super.super._url, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("sms")))
    {
      v8 = self->super.super._url;
    }
    else
    {
      if (self->super._serviceID && objc_msgSend(v7, "isEqualToString:", CFSTR("sip")))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms:%@?service_id=%@"), self->super._phoneNumber, self->super._serviceID);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        body = self->super._body;
        if (body)
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](body, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("&body=%@"), v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v13;
        }
        if (self->super._suggestions)
        {
          objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("&suggestions=%@"), self->super._suggestions);
          v14 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v14;
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
        v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSURL webSafeTelephoneURL](self->super.super._url, "webSafeTelephoneURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0C99E98];
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "resourceSpecifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("sms:%@"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLWithString:", v18);
        v8 = (NSURL *)objc_claimAutoreleasedReturnValue();

      }
    }
    v5 = v8;

  }
  return v5;
}

- (void)performFromView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDTextMessageAction notificationURL](self, "notificationURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DDAction _performFromView:byOpeningURL:](self, "_performFromView:byOpeningURL:", v4, v5);

}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (id)viewController
{
  double v2;
  UIViewController *viewController;
  uint64_t v5;
  UIViewController *v6;
  void *v7;
  void *v8;
  UIViewController *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  viewController = self->super.super._viewController;
  if (!viewController)
  {
    if (self->super._phoneNumber)
    {
      gotLoadHelper_x8__OBJC_CLASS___MFMessageComposeViewController(v2);
      v6 = (UIViewController *)objc_alloc_init(*(Class *)(v5 + 2248));
      -[NSString dd_userFriendlyEmail](self->super._phoneNumber, "dd_userFriendlyEmail");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController setRecipients:](v6, "setRecipients:", v8);

      -[UIViewController setBody:](v6, "setBody:", self->super._body);
      -[UIViewController setServiceId:](v6, "setServiceId:", self->super._serviceID);
      -[UIViewController setSuggestions:](v6, "setSuggestions:", self->super._suggestions);
      -[UIViewController setMessageComposeDelegate:](v6, "setMessageComposeDelegate:", self);
      v9 = self->super.super._viewController;
      self->super.super._viewController = v6;

      return self->super.super._viewController;
    }
    viewController = 0;
  }
  return viewController;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  objc_msgSend(a3, "setMessageComposeDelegate:", 0, a4);
  -[DDAction delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[DDAction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[DDAction delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "actionDidFinish:", self);

    }
  }
}

@end
