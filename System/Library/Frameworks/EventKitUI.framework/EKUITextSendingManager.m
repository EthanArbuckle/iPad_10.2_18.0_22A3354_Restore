@implementation EKUITextSendingManager

+ (void)getPhone:(id *)a3 andEmail:(id *)a4 forContact:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a5;
  v17 = v7;
  if (a3)
  {
    objc_msgSend(v7, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v7 = v17;
    if (v9)
    {
      objc_msgSend(v17, "phoneNumbers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v17;
    }
  }
  if (a4)
  {
    objc_msgSend(v17, "emailAddresses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v7 = v17;
    if (v14)
    {
      objc_msgSend(v17, "emailAddresses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "value");
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v17;
    }
  }

}

+ (id)addressesForRecipientsOnEvent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUICommunicationUtilities attendeesIgnoringMe:](EKUICommunicationUtilities, "attendeesIgnoringMe:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v5;
  v7 = v6;
  CalendarFoundationPerformBlockOnSharedContactStore();
  v8 = v10;

  return v8;
}

void __56__EKUITextSendingManager_addressesForRecipientsOnEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id obj;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    v20 = *MEMORY[0x1E0C967C0];
    v19 = *MEMORY[0x1E0C966A8];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v6);
        objc_msgSend(v7, "phoneNumber", v19, v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "emailAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = v8 == 0;
        else
          v10 = 1;
        if (!v10)
          goto LABEL_14;
        v29[0] = v20;
        v29[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "contactPredicate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "unifiedContactsMatchingPredicate:keysToFetch:error:", v12, v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 48);
          v23 = v9;
          v24 = v8;
          objc_msgSend(v15, "getPhone:andEmail:forContact:", &v24, &v23, v14);
          v16 = v24;

          v17 = v23;
          v9 = v17;
          v8 = v16;
        }

        if (v8)
        {
LABEL_14:
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

          v9 = v8;
LABEL_15:

          goto LABEL_16;
        }
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
          goto LABEL_15;
        }
LABEL_16:
        ++v6;
      }
      while (v4 != v6);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v4 = v18;
    }
    while (v18);
  }

}

+ (BOOL)messagingAvailable
{
  void *v2;
  char v3;

  objc_msgSend((id)EKWeakLinkClass(), "defaultCapabilitiesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMadridConfigured");

  return v3;
}

+ (BOOL)canSendMessageToRecipientsOnEvent:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasAttendees") && objc_msgSend(a1, "messagingAvailable"))
  {
    objc_msgSend(a1, "addressesForRecipientsOnEvent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EKUITextSendingManager)initWithEvent:(id)a3
{
  id v4;
  EKUITextSendingManager *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKUITextSendingManager;
  v5 = -[EKUITextSendingManager init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "addressesForRecipientsOnEvent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITextSendingManager setupControllerWithAddresses:](v5, "setupControllerWithAddresses:", v6);

  }
  return v5;
}

- (void)setupControllerWithAddresses:(id)a3
{
  MFMessageComposeViewController *v4;
  MFMessageComposeViewController *composeViewController;
  id v6;

  v6 = a3;
  v4 = (MFMessageComposeViewController *)objc_alloc_init(+[CalendarMessageUIProxy MFMessageComposeViewControllerClass](CalendarMessageUIProxy, "MFMessageComposeViewControllerClass"));
  composeViewController = self->_composeViewController;
  self->_composeViewController = v4;

  -[MFMessageComposeViewController setMessageComposeDelegate:](self->_composeViewController, "setMessageComposeDelegate:", self);
  -[MFMessageComposeViewController setRecipients:](self->_composeViewController, "setRecipients:", v6);

}

- (UIViewController)viewController
{
  return (UIViewController *)self->_composeViewController;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  void *v6;
  void (**v7)(id, BOOL);

  -[EKUITextSendingManager messageSendingComplete](self, "messageSendingComplete", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EKUITextSendingManager messageSendingComplete](self, "messageSendingComplete");
    v7 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue();
    v7[2](v7, a4 == 1);

  }
}

- (id)messageSendingComplete
{
  return self->_messageSendingComplete;
}

- (void)setMessageSendingComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageSendingComplete, 0);
  objc_storeStrong((id *)&self->_composeViewController, 0);
}

@end
