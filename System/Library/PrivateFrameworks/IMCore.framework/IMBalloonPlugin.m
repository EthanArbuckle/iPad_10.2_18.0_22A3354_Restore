@implementation IMBalloonPlugin

- (NSString)identifier
{
  return -[IMBalloonApp identifier](self->_app, "identifier");
}

- (IMBalloonPlugin)initWithBundle:(id)a3 app:(id)a4
{
  id v6;
  id v7;
  IMBalloonPlugin *v8;
  IMBalloonPlugin *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *messageToBalloonControllerMap;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IMBalloonPlugin;
  v8 = -[IMBalloonPlugin init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IMBalloonPlugin setPluginLoaded:](v8, "setPluginLoaded:", 0);
    objc_storeStrong((id *)&v9->_app, a4);
    -[IMBalloonPlugin setBundle:](v9, "setBundle:", v6);
    objc_msgSend(v6, "infoDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("CKBrowserGroup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    -[IMBalloonPlugin setBrowserGroup:](v9, "setBrowserGroup:", v12);
    objc_msgSend(v10, "objectForKey:", CFSTR("CKBrowserShowInBrowser"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(v7, "setShowInBrowser:", 0);
      objc_msgSend(v7, "setShowInSendMenu:", 0);
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("CKBrowserDisplayImageName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      -[IMBalloonPlugin setBrowserImageName:](v9, "setBrowserImageName:", v15);
    objc_msgSend(v10, "objectForKey:", CFSTR("kCKBrowserDisplayImagePath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      -[IMBalloonPlugin setBrowserImagePath:](v9, "setBrowserImagePath:", v16);
    if (!v9->_messageToBalloonControllerMap)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      messageToBalloonControllerMap = v9->_messageToBalloonControllerMap;
      v9->_messageToBalloonControllerMap = (NSMutableDictionary *)Mutable;

    }
  }

  return v9;
}

- (NSBundle)appBundle
{
  return -[IMBalloonApp appBundle](self->_app, "appBundle");
}

- (BOOL)showInSendMenu
{
  return MEMORY[0x1E0DE7D20](self->_app, sel_showInSendMenu);
}

- (NSString)version
{
  return (NSString *)CFSTR("IMBalloonPluginVersionUndefined");
}

- (BOOL)showInBrowser
{
  return MEMORY[0x1E0DE7D20](self->_app, sel_showInBrowser);
}

- (void)setPluginLoaded:(BOOL)a3
{
  self->_pluginLoaded = a3;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (void)setBrowserImageName:(id)a3
{
  objc_storeStrong((id *)&self->_browserImageName, a3);
}

- (void)setBrowserGroup:(int64_t)a3
{
  self->_browserGroup = a3;
}

- (unint64_t)presentationContexts
{
  return MEMORY[0x1E0DE7D20](self->_app, sel_presentationContexts);
}

- (NSBundle)pluginBundle
{
  return -[IMBalloonApp pluginBundle](self->_app, "pluginBundle");
}

- (NSMutableDictionary)messageToDatasourceMap
{
  return self->_messageToDatasourceMap;
}

- (BOOL)isStickerPackOnly
{
  return -[IMBalloonApp isStickerPackOnly](self->_app, "isStickerPackOnly");
}

- (BOOL)isEnabled
{
  return -[IMBalloonApp isEnabled](self->_app, "isEnabled");
}

- (IMBalloonPlugin)initWithBundle:(id)a3
{
  id v4;
  void *v5;
  IMBalloonPlugin *v6;
  void *v7;

  v4 = a3;
  +[IMBalloonApp appWithPluginBundle:](IMBalloonApp, "appWithPluginBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IMBalloonPlugin initWithBundle:app:](self, "initWithBundle:app:", v4, v5);
  if (v6)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v7);

  }
  return v6;
}

- (Class)dataSourceClass
{
  return -[IMBalloonApp dataSourceClass](self->_app, "dataSourceClass");
}

- (Class)bubbleClass
{
  return -[IMBalloonApp bubbleClass](self->_app, "bubbleClass");
}

- (NSString)browserImagePath
{
  return self->_browserImagePath;
}

- (NSString)browserImageName
{
  return self->_browserImageName;
}

- (NSString)browserDisplayName
{
  return -[IMBalloonApp browserDisplayName](self->_app, "browserDisplayName");
}

- (IMBalloonApp)app
{
  return self->_app;
}

- (IMBalloonPlugin)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Unsupported init"), CFSTR("[IMBalloonPlugin init] is not supported"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[IMBalloonPlugin unloadBundle](self, "unloadBundle");
  v4.receiver = self;
  v4.super_class = (Class)IMBalloonPlugin;
  -[IMBalloonPlugin dealloc](&v4, sel_dealloc);
}

- (void)unloadBundle
{
  NSMutableArray *balloonControllerPool;

  -[IMBalloonPlugin setPluginLoaded:](self, "setPluginLoaded:", 0);
  -[IMBalloonPlugin setBubbleClass:](self, "setBubbleClass:", 0);
  -[IMBalloonPlugin setBrowserClass:](self, "setBrowserClass:", 0);
  -[IMBalloonPlugin setDataSourceClass:](self, "setDataSourceClass:", 0);
  -[IMBalloonPlugin setCustomTypingIndicatorLayerClass:](self, "setCustomTypingIndicatorLayerClass:", 0);
  -[IMBalloonPlugin setEntryClass:](self, "setEntryClass:", 0);
  balloonControllerPool = self->_balloonControllerPool;
  self->_balloonControllerPool = 0;

}

- (id)_getControllerFromReusePoolForChatItem:(id)a3 contextIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *balloonControllerPool;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  balloonControllerPool = self->_balloonControllerPool;
  if (!balloonControllerPool)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_balloonControllerPool;
    self->_balloonControllerPool = v9;

    balloonControllerPool = self->_balloonControllerPool;
  }
  if (-[NSMutableArray count](balloonControllerPool, "count"))
  {
    -[NSMutableArray lastObject](self->_balloonControllerPool, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE6B4378))
      objc_msgSend(v11, "setDataSource:", v12);
    objc_msgSend(v12, "messageGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPlugin balloonControllerKeyForMessageGUID:contextIdentifier:](self, "balloonControllerKeyForMessageGUID:contextIdentifier:", v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_messageToBalloonControllerMap, "setObject:forKey:", v11, v14);
    -[NSMutableArray removeLastObject](self->_balloonControllerPool, "removeLastObject");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)balloonControllerKeyForMessageGUID:(id)a3 contextIdentifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), a3, a4);
}

- (id)existingBalloonControllerWithMessageGUID:(id)a3 contextIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[IMBalloonPlugin balloonControllerKeyForMessageGUID:contextIdentifier:](self, "balloonControllerKeyForMessageGUID:contextIdentifier:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_messageToBalloonControllerMap, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Context identifier is nil, can't load balloonController from cache", v12, 2u);
      }

    }
    v9 = 0;
  }

  return v9;
}

- (id)balloonControllerForChatItem:(id)a3 contextIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_msgSend(v8, "messageGUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPlugin existingBalloonControllerWithMessageGUID:contextIdentifier:](self, "existingBalloonControllerWithMessageGUID:contextIdentifier:", v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_19;
      if (-[IMBalloonPlugin supportsControllerReuse](self, "supportsControllerReuse"))
      {
        -[IMBalloonPlugin _getControllerFromReusePoolForChatItem:contextIdentifier:](self, "_getControllerFromReusePoolForChatItem:contextIdentifier:", v6, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_19;
      }
      if ((-[objc_class conformsToProtocol:](-[IMBalloonPlugin bubbleClass](self, "bubbleClass"), "conformsToProtocol:", &unk_1EE6AA7C8) & 1) != 0)
      {
        v12 = (void *)objc_msgSend(objc_alloc(-[IMBalloonPlugin bubbleClass](self, "bubbleClass")), "initWithDataSource:isFromMe:", v8, objc_msgSend(v6, "isFromMe"));
        if (v12)
        {
          objc_msgSend(v8, "messageGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMBalloonPlugin balloonControllerKeyForMessageGUID:contextIdentifier:](self, "balloonControllerKeyForMessageGUID:contextIdentifier:", v13, v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKey:](self->_messageToBalloonControllerMap, "setObject:forKey:", v12, v14);
        }
        goto LABEL_19;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "messageGUID");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "guid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412802;
          v22 = v19;
          v23 = 2048;
          v24 = v8;
          v25 = 2112;
          v26 = v20;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "IMBalloonPluginManager - bubbleClass does not conform to IMBalloonPluginController protocol; message guid: %"
            "@, dataSource: %p, chat item guid: %@",
            (uint8_t *)&v21,
            0x20u);

        }
LABEL_17:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "guid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218242;
        v22 = v8;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "balloonControllerForChatItem dataSource: %p, chat item guid: %@", (uint8_t *)&v21, 0x16u);

      }
      goto LABEL_17;
    }
    v12 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Context identifier is nil!", (uint8_t *)&v21, 2u);
    }

  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (void)moveController:(id)a3 toReusePoolFromChatItem:(id)a4 contextIdentifier:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *balloonControllerPool;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v16, "setDataSource:", 0);
  if (v16)
  {
    balloonControllerPool = self->_balloonControllerPool;
    if (!balloonControllerPool)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = self->_balloonControllerPool;
      self->_balloonControllerPool = v11;

      balloonControllerPool = self->_balloonControllerPool;
    }
    -[NSMutableArray addObject:](balloonControllerPool, "addObject:", v16);
    objc_msgSend(v8, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPlugin balloonControllerKeyForMessageGUID:contextIdentifier:](self, "balloonControllerKeyForMessageGUID:contextIdentifier:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectForKey:](self->_messageToBalloonControllerMap, "removeObjectForKey:", v15);
  }

}

- (void)removeController:(id)a3 forChatItem:(id)a4 contextIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *messageToDatasourceMap;
  void *v14;
  void *v15;
  id v16;

  v8 = a4;
  if (a3)
  {
    v16 = v8;
    v9 = a5;
    objc_msgSend(v16, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPlugin balloonControllerKeyForMessageGUID:contextIdentifier:](self, "balloonControllerKeyForMessageGUID:contextIdentifier:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectForKey:](self->_messageToBalloonControllerMap, "removeObjectForKey:", v12);
    if (-[IMBalloonPlugin _canRemoveControllerFromCachedDatasource](self, "_canRemoveControllerFromCachedDatasource"))
    {
      messageToDatasourceMap = self->_messageToDatasourceMap;
      objc_msgSend(v16, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "messageGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](messageToDatasourceMap, "removeObjectForKey:", v15);

    }
    v8 = v16;
  }

}

- (BOOL)supportsControllerReuse
{
  return -[objc_class conformsToProtocol:](-[IMBalloonPlugin bubbleClass](self, "bubbleClass"), "conformsToProtocol:", &unk_1EE6B4378);
}

- (BOOL)shouldShowForRecipients:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_5;
  -[IMBalloonPlugin identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D374C8]);

  if (!v6)
    goto LABEL_5;
  if (objc_msgSend(v4, "count") != 1
    || (objc_msgSend(v4, "objectAtIndexedSubscript:", 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = MEMORY[0x1A85827F4](),
        v7,
        (v8 & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Attempt to display the business extension in a non-business context, recipients: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    v9 = 0;
  }
  else
  {
LABEL_5:
    v9 = 1;
  }

  return v9;
}

- (BOOL)linkedBeforeSDKVersion:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMBalloonPlugin app](self, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "linkedBeforeSDKVersion:", v4);

  return v6;
}

- (id)existingDataSourceForMessageGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMBalloonPlugin messageToDatasourceMap](self, "messageToDatasourceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)insertDataSource:(id)a3 forGUID:(id)a4
{
  id v6;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *messageToDatasourceMap;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && v6)
  {
    if (!self->_messageToDatasourceMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      messageToDatasourceMap = self->_messageToDatasourceMap;
      self->_messageToDatasourceMap = Mutable;

    }
    -[IMBalloonPlugin messageToDatasourceMap](self, "messageToDatasourceMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v6);

  }
}

- (id)dataSourceForPluginPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *messageToDatasourceMap;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pluginSessionGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPlugin messageToDatasourceMap](self, "messageToDatasourceMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!self->_messageToDatasourceMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      messageToDatasourceMap = self->_messageToDatasourceMap;
      self->_messageToDatasourceMap = Mutable;

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v5;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "We did not find a datasource for messageGUID: %@", (uint8_t *)&v16, 0xCu);
      }

    }
    +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPlugin identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_msgSend(v12, "dataSourceClassForBundleID:", v13);

    if (v14)
    {
      v7 = (void *)objc_msgSend([v14 alloc], "initWithPluginPayload:", v4);
      if (v5)
      {
        -[IMBalloonPlugin messageToDatasourceMap](self, "messageToDatasourceMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v7, v5);

      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)extensionIdentifier
{
  NSString *extensionIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  extensionIdentifier = self->_extensionIdentifier;
  if (!extensionIdentifier)
  {
    -[IMBalloonPlugin identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0D375D0]) & 1) != 0)
    {
      v5 = v4;
    }
    else
    {
      IMBalloonExtensionIDWithSuffix();
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v6 = self->_extensionIdentifier;
    self->_extensionIdentifier = v5;

    extensionIdentifier = self->_extensionIdentifier;
  }
  return extensionIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  void *v2;
  void *v3;

  -[IMBalloonApp plugin](self->_app, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isBetaPlugin
{
  return 0;
}

- (BOOL)shouldDelayViewControllerPresentation
{
  return MEMORY[0x1E0DE7D20](self->_app, sel_shouldDelayViewControllerPresentation);
}

- (double)presentationDelay
{
  double result;

  MEMORY[0x1E0DE7D20](self->_app, sel_presentationDelay);
  return result;
}

- (BOOL)showableInBrowser
{
  return MEMORY[0x1E0DE7D20](self->_app, sel_showableInBrowser);
}

- (BOOL)allowsPresentationWithSendLater
{
  void *v2;
  void *v3;
  char v4;

  -[IMBalloonPlugin identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4 ^ 1;
}

- (BOOL)shouldHideAppSwitcher
{
  return MEMORY[0x1E0DE7D20](self->_app, sel_shouldHideAppSwitcher);
}

- (BOOL)shouldBalloonHideAppIcon
{
  return -[IMBalloonApp shouldBalloonHideAppIcon](self->_app, "shouldBalloonHideAppIcon");
}

- (BOOL)shouldBreadcrumbHideAppIcon
{
  return -[IMBalloonApp shouldBreadcrumbHideAppIcon](self->_app, "shouldBreadcrumbHideAppIcon");
}

- (NSString)appStoreGenre
{
  return -[IMBalloonApp appStoreGenre](self->_app, "appStoreGenre");
}

- (NSArray)appStoreSubgenres
{
  return -[IMBalloonApp appStoreSubgenres](self->_app, "appStoreSubgenres");
}

- (BOOL)hideAttributionInformation
{
  return MEMORY[0x1E0DE7D20](self->_app, sel_shouldHideAttributionInformation);
}

- (Class)browserClass
{
  return (Class)MEMORY[0x1E0DE7D20](self->_app, sel_browserClass);
}

- (NSString)browserShortDisplayName
{
  return (NSString *)MEMORY[0x1E0DE7D20](self->_app, sel_browserShortDisplayName);
}

- (Class)customTypingIndicatorLayerClass
{
  return (Class)MEMORY[0x1E0DE7D20](self->_app, sel_customTypingIndicatorLayerClass);
}

- (Class)entryClass
{
  return (Class)MEMORY[0x1E0DE7D20](self->_app, sel_entryClass);
}

- (void)setIdentifier:(id)a3
{
  -[IMBalloonApp setIdentifier:](self->_app, "setIdentifier:", a3);
}

- (BOOL)pluginLoaded
{
  return -[IMBalloonApp pluginLoaded](self->_app, "pluginLoaded");
}

- (unint64_t)stickerSharingLevel
{
  return MEMORY[0x1E0DE7D20](self->_app, sel_stickerSharingLevel);
}

- (id)adamID
{
  return 0;
}

- (id)attributionInfo
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFDictionary *v8;

  if (-[IMBalloonPlugin hideAttributionInformation](self, "hideAttributionInformation"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPlugin identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0D37F30], v5);

    -[IMBalloonPlugin browserDisplayName](self, "browserDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0D37F20], v6);

    -[IMBalloonPlugin adamID](self, "adamID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0D37F18], v7);

    if (-[__CFDictionary count](v4, "count"))
      v8 = v4;
    else
      v8 = 0;
    v3 = v8;

  }
  return v3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setBubbleClass:(Class)a3
{
  objc_storeStrong((id *)&self->_bubbleClass, a3);
}

- (void)setBrowserClass:(Class)a3
{
  objc_storeStrong((id *)&self->_browserClass, a3);
}

- (void)setDataSourceClass:(Class)a3
{
  objc_storeStrong((id *)&self->_dataSourceClass, a3);
}

- (void)setCustomTypingIndicatorLayerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_customTypingIndicatorLayerClass, a3);
}

- (void)setEntryClass:(Class)a3
{
  objc_storeStrong((id *)&self->_entryClass, a3);
}

- (void)setBrowserImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_browserImagePath, a3);
}

- (int64_t)browserGroup
{
  return self->_browserGroup;
}

- (BOOL)isLaunchProhibited
{
  return self->_isLaunchProhibited;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (PKPlugIn)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_plugin, a3);
}

- (void)setApp:(id)a3
{
  objc_storeStrong((id *)&self->_app, a3);
}

- (void)setMessageToDatasourceMap:(id)a3
{
  objc_storeStrong((id *)&self->_messageToDatasourceMap, a3);
}

- (NSMutableDictionary)messageToBalloonControllerMap
{
  return self->_messageToBalloonControllerMap;
}

- (void)setMessageToBalloonControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_messageToBalloonControllerMap, a3);
}

- (NSMutableArray)balloonControllerPool
{
  return self->_balloonControllerPool;
}

- (void)setBalloonControllerPool:(id)a3
{
  objc_storeStrong((id *)&self->_balloonControllerPool, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonControllerPool, 0);
  objc_storeStrong((id *)&self->_messageToBalloonControllerMap, 0);
  objc_storeStrong((id *)&self->_messageToDatasourceMap, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_browserImagePath, 0);
  objc_storeStrong((id *)&self->_browserImageName, 0);
  objc_storeStrong((id *)&self->_entryClass, 0);
  objc_storeStrong((id *)&self->_customTypingIndicatorLayerClass, 0);
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
  objc_storeStrong((id *)&self->_browserClass, 0);
  objc_storeStrong((id *)&self->_bubbleClass, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end
