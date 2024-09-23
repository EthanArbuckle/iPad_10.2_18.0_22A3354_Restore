@implementation CKRCSController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKRCSController;
  -[CKRCSController viewDidLoad](&v5, sel_viewDidLoad);
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", self->_controllerTitle, self->_controllerTitle, CFSTR("Messages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKRCSController setTitle:](self, "setTitle:", v4);
}

- (id)specifiers
{
  CKRCSController *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  uint64_t v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id obj;
  void *v73;
  CKRCSController *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;
  NSRange v81;
  NSRange v82;

  v2 = self;
  v80 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    MessagesSettingsLocalizedString(CFSTR("RCS_FOOTER_LEARN_MORE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("RCS_FOOTER_TEXT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "rangeOfString:", v6);
    v12 = v11;
    -[CKRCSController ctSubscriptions](v2, "ctSubscriptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 == 1)
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("RCS"), &stru_24D077260);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProperty:forKey:", v17, *MEMORY[0x24BE75A30]);

      v81.location = v10;
      v81.length = v12;
      NSStringFromRange(v81);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProperty:forKey:", v18, *MEMORY[0x24BE75A40]);

      objc_msgSend(v15, "setProperty:forKey:", v9, *MEMORY[0x24BE75A58]);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProperty:forKey:", v19, *MEMORY[0x24BE75A50]);

      NSStringFromSelector(sel__showRCSLearnMore);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProperty:forKey:", v20, *MEMORY[0x24BE75A38]);

      objc_msgSend(v5, "addObject:", v15);
      v21 = objc_alloc(MEMORY[0x24BE75590]);
      MessagesSettingsLocalizedString(CFSTR("RCS_MESSAGING"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithName:target:set:get:detail:cell:edit:", v22, v2, sel_setRCSEnabled_specifier_, sel_isRCSEnabled_, 0, 6, 0);

      -[CKRCSController ctSubscriptions](v2, "ctSubscriptions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "phoneNumber");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setProperty:forKey:", v26, CFSTR("phoneNumber"));

      objc_msgSend(v25, "labelID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setProperty:forKey:", v27, CFSTR("simID"));

      objc_msgSend(v5, "addObject:", v23);
    }
    else
    {
      v70 = v6;
      v71 = v3;
      CommunicationsSetupUIBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", v2->_multiSimHeaderKey, v2->_multiSimHeaderKey, CFSTR("Messages"));
      v29 = objc_claimAutoreleasedReturnValue();

      v68 = (void *)v29;
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, v2, 0, 0, 0, 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setProperty:forKey:", v32, *MEMORY[0x24BE75A30]);

      v82.location = v10;
      v82.length = v12;
      NSStringFromRange(v82);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setProperty:forKey:", v33, *MEMORY[0x24BE75A40]);

      v69 = v9;
      objc_msgSend(v30, "setProperty:forKey:", v9, *MEMORY[0x24BE75A58]);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setProperty:forKey:", v34, *MEMORY[0x24BE75A50]);

      NSStringFromSelector(sel__showRCSLearnMore);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setProperty:forKey:", v35, *MEMORY[0x24BE75A38]);

      v73 = v5;
      v67 = v30;
      objc_msgSend(v5, "addObject:", v30);
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v74 = v2;
      -[CKRCSController ctSubscriptions](v2, "ctSubscriptions");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v76 != v38)
              objc_enumerationMutation(obj);
            v40 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
            v41 = (void *)MEMORY[0x24BE511B0];
            objc_msgSend(v40, "phoneNumber");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "labelID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "IMUniqueIdentifierForPhoneNumber:simID:", v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              v45 = (void *)MEMORY[0x24BE75590];
              objc_msgSend(v40, "label");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v46, v74, sel_setEnabledForSubscription_specifier_, sel_isEnabledForSubscription_, 0, 6, 0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("RCSEnabled-"), v44);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setIdentifier:", v48);
              objc_msgSend(v40, "labelID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if (v49)
              {
                objc_msgSend(v40, "labelID");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setProperty:forKey:", v50, CFSTR("simID"));

              }
              objc_msgSend(v40, "phoneNumber");
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51)
              {
                objc_msgSend(v40, "phoneNumber");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setProperty:forKey:", v52, CFSTR("phoneNumber"));

              }
              objc_msgSend(v73, "addObject:", v47);

            }
          }
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
        }
        while (v37);
      }

      v5 = v73;
      v2 = v74;
      v6 = v70;
      v3 = v71;
      v9 = v69;
    }
    objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isLazuliEnabled");

    if (v54)
    {
      -[CKRCSController lazuliEnablementManager](v2, "lazuliEnablementManager");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isRCSBusinessMessagingSupported");

      if (v56)
      {
        objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("BusinessRCSMessages"), 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        MessagesSettingsLocalizedString(CFSTR("RCS_BUSINESS_MESSAGES_GROUP_FOOTER"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setProperty:forKey:", v58, *MEMORY[0x24BE75A68]);

        objc_msgSend(v5, "addObject:", v57);
        v59 = (void *)MEMORY[0x24BE75590];
        MessagesSettingsLocalizedString(CFSTR("RCS_BUSINESS_MESSAGES_SWITCH"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v60, v2, sel_setRCSBusinessMessagesEnabled_specifier_, sel_rcsBusinessMessagesEnabled_, 0, 6, 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKRCSController lazuliEnablementManager](v2, "lazuliEnablementManager");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "isRCSEnabledForAnyActiveSubscription");

        if ((v63 & 1) == 0)
          objc_msgSend(v61, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
        objc_msgSend(v5, "addObject:", v61);

      }
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v3) = (Class)v64;

    v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)isRCSEnabled:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[CKRCSController isRCSEnabled:]";
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
    }

  }
  -[CKRCSController lazuliEnablementManager](self, "lazuliEnablementManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isRCSEnabled:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setRCSEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[CKRCSController setRCSEnabled:specifier:]";
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
    }

  }
  -[CKRCSController lazuliEnablementManager](self, "lazuliEnablementManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRCSEnabled:specifier:", v6, v7);

  -[CKRCSController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)setRCSBusinessMessagesEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_INFO, "Set RCS Business Messages Enabled: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCF50], "messagesAppDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("RCSForBusinessEnabled"));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.RCSForBusinessEnabled.changed"), 0, 0, 1u);

}

- (id)rcsBusinessMessagesEnabled:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CKRCSController lazuliEnablementManager](self, "lazuliEnablementManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRCSEnabledForAnyActiveSubscription");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "messagesAppDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("RCSForBusinessEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_INFO, "Setting RCS Business Messages from Carrier Bundle", (uint8_t *)&v16, 2u);
        }

      }
      -[CKRCSController lazuliEnablementManager](self, "lazuliEnablementManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "isRCSBusinessMessagingEnabledByDefault");

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = CFSTR("NO");
        if ((_DWORD)v9)
          v14 = CFSTR("YES");
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_INFO, "RCS Business Messages Enabled: %@", (uint8_t *)&v16, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v10;
}

- (void)_showRCSLearnMore
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  MessagesSettingsLocalizedString(CFSTR("RCS_LEARN_MORE_URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "openURL:withCompletionHandler:", v5, 0);
    v4 = v5;
  }

}

- (id)isEnabledForSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKRCSController lazuliEnablementManager](self, "lazuliEnablementManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isRCSEnabled:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[CKRCSController lazuliEnablementManager](self, "lazuliEnablementManager");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setRCSEnabled:specifier:](v8, "setRCSEnabled:specifier:", v6, v7);
  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_4;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_INFO, "Ignoring attempt to set RCS enablement to NULL", v9, 2u);
    }
  }

LABEL_4:
}

- (NSString)multiSimHeaderKey
{
  return self->_multiSimHeaderKey;
}

- (void)setMultiSimHeaderKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (NSString)controllerTitle
{
  return self->_controllerTitle;
}

- (void)setControllerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (NSArray)ctSubscriptions
{
  return self->_ctSubscriptions;
}

- (void)setCtSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_ctSubscriptions, a3);
}

- (CKLazuliEnablementManager)lazuliEnablementManager
{
  return self->_lazuliEnablementManager;
}

- (void)setLazuliEnablementManager:(id)a3
{
  objc_storeStrong((id *)&self->_lazuliEnablementManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazuliEnablementManager, 0);
  objc_storeStrong((id *)&self->_ctSubscriptions, 0);
  objc_storeStrong((id *)&self->_controllerTitle, 0);
  objc_storeStrong((id *)&self->_multiSimHeaderKey, 0);
}

@end
