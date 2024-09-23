void sub_230EC022C()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.ap.adprivacyd.iTunesActiveStorefrontDidChangeNotification"), 0, 0, 0);
}

void sub_230EC0340()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.ap.adprivacyd.iTunesActiveAccountDidChangeNotification"), 0, 0, 0);
}

void sub_230EC04B0()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.ap.adprivacyd.iTunesActiveStorefrontDidChangeNotification"), 0, 0, 0);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

uint64_t _ADLog()
{
  return MEMORY[0x24BE02280]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

2 = objc_msgSend(v12, "isActive");
    v23 = (a4 == 2) & ~v22;
    if (a4 == 1)
      v23 = 1;
    v24 = v23 & v21;
    if (a4 == 2 && v21)
    {
      v25 = objc_msgSend(v32, "isAuthenticated");
      v26 = 0;
    }
    else
    {
      v25 = 0;
      v27 = 0;
      v28 = 0;
      if (a4 == 3)
        v26 = v22;
      else
        v26 = 0;
      if (a4 != 2)
      {
LABEL_20:
        if (v24)
        {
          -[ADAccountsNotificationPlugin postNotificationForChangeWithAccount:andOldAccount:withType:](self, "postNotificationForChangeWithAccount:andOldAccount:withType:", v32, v12, CFSTR("iTunes account LOGGING IN"));
          objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "purpleBuddyWillRun");

          if (v30)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Purple Buddy has not yet run. We will not notify the daemon."), objc_opt_class());
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            _ADLog();

          }
          else
          {
            dispatch_async((dispatch_queue_t)qword_25414B150, &unk_24FFA0D38);
          }
        }
        else
        {
          if ((v26 | v28) == 1)
          {
            v17 = CFSTR("iTunes account LOGGING OUT");
            goto LABEL_25;
          }
          if (v27)
            -[ADAccountsNotificationPlugin checkForStorefrontChangeWithAccount:andOldAccount:](self, "checkForStorefrontChangeWithAccount:andOldAccount:", v32, v12);
        }
        goto LABEL_26;
      }
    }
    v28 = v22 & (v21 ^ 1);
    v27 = v25;
    goto LABEL_20;
  }
  objc_msgSend(v32, "accountType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDB3FD8]) & 1) == 0)
    goto LABEL_9;
  if (a4 == 1)
  {
    objc_msgSend(v32, "accountPropertyForKey:", CFSTR("primaryAccount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      v17 = CFSTR("iCloud account LOGGING IN");
      goto LABEL_25;
    }
  }
LABEL_26:

}

- (void)postNotificationForChangeWithAccount:(id)a3 andOldAccount:(id)a4 withType:(id)a5
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The active account was changed due to an %@."), a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "purpleBuddyWillRun");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Purple Buddy has not yet run. We will not notify the daemon."), objc_opt_class());
    v8 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  else
  {
    dispatch_async((dispatch_queue_t)qword_25414B150, &unk_24FFA0D58);
  }
}

- (void)checkForStorefrontChangeWithAccount:(id)a3 andOldAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v5 = a4;
  objc_msgSend(a3, "ams_storefront");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_storefront");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The active account storefront was changed."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "purpleBuddyWillRun");

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Purple Buddy has not yet run. We will not notify the daemon."), objc_opt_class());
      v11 = (id)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    else
    {
      dispatch_async((dispatch_queue_t)qword_25414B150, &unk_24FFA0D78);
    }
  }
}

@end
