@implementation QLDetachedSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  QLPreviewController *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "stateRestorationActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v9, "stateRestorationActivity");
  else
    -[QLDetachedSceneDelegate activityFromOptions:](self, "activityFromOptions:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetachedSceneDelegate setQuicklookActivity:](self, "setQuicklookActivity:", v12);

  -[QLDetachedSceneDelegate quicklookActivity](self, "quicklookActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.quicklook.private.activity.URLsKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetachedSceneDelegate setUrls:](self, "setUrls:", v15);

  -[QLDetachedSceneDelegate quicklookActivity](self, "quicklookActivity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("com.apple.quicklook.private.activity.IndexKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetachedSceneDelegate setSelectedURLIndex:](self, "setSelectedURLIndex:", objc_msgSend(v18, "unsignedIntValue"));

  -[QLDetachedSceneDelegate quicklookActivity](self, "quicklookActivity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("com.apple.quicklook.private.activity.EditingModes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetachedSceneDelegate setEditingModes:](self, "setEditingModes:", v21);

  v31 = v8;
  v22 = objc_alloc_init(QLPreviewController);
  -[QLDetachedSceneDelegate setQuicklookController:](self, "setQuicklookController:", v22);

  -[QLDetachedSceneDelegate quicklookController](self, "quicklookController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelegate:", self);

  -[QLDetachedSceneDelegate quicklookController](self, "quicklookController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDataSource:", self);

  v25 = -[QLDetachedSceneDelegate selectedURLIndex](self, "selectedURLIndex");
  -[QLDetachedSceneDelegate quicklookController](self, "quicklookController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCurrentPreviewItemIndex:", v25);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB58]), "initWithWindowScene:", v31);
  -[QLDetachedSceneDelegate setWindow:](self, "setWindow:", v27);

  -[QLDetachedSceneDelegate quicklookController](self, "quicklookController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetachedSceneDelegate window](self, "window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setRootViewController:", v28);

  -[QLDetachedSceneDelegate window](self, "window");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "makeKeyAndVisible");

}

- (void)sceneDidDisconnect:(id)a3
{
  -[QLDetachedSceneDelegate setWindow:](self, "setWindow:", 0);
  -[QLDetachedSceneDelegate setQuicklookController:](self, "setQuicklookController:", 0);
  -[QLDetachedSceneDelegate setUrls:](self, "setUrls:", 0);
  -[QLDetachedSceneDelegate setSelectedURLIndex:](self, "setSelectedURLIndex:", 0);
  -[QLDetachedSceneDelegate setEditingModes:](self, "setEditingModes:", MEMORY[0x24BDBD1B8]);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4;

  -[QLDetachedSceneDelegate quicklookController](self, "quicklookController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[QLDetachedSceneDelegate setSelectedURLIndex:](self, "setSelectedURLIndex:", objc_msgSend(v4, "currentPreviewItemIndex"));

}

- (id)activityFromOptions:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "userActivities", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "activityType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.quicklook.private.scene.detachedActivityType"));

        if ((v10 & 1) != 0)
        {
          v11 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)previewControllerWillDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[QLDetachedSceneDelegate window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSceneSessionDestruction:options:errorHandler:", v6, 0, 0);

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v3;
  int64_t v4;

  -[QLDetachedSceneDelegate urls](self, "urls", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;

  -[QLDetachedSceneDelegate urls](self, "urls", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = a4;
  -[QLDetachedSceneDelegate editingModes](self, "editingModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  return v8;
}

- (id)stateRestorationActivityForScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1598]), "initWithActivityType:", CFSTR("com.apple.quicklook.private.scene.detachedActivityType"));
  v9[0] = CFSTR("com.apple.quicklook.private.activity.URLsKey");
  -[QLDetachedSceneDelegate urls](self, "urls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("com.apple.quicklook.private.activity.IndexKey");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[QLDetachedSceneDelegate selectedURLIndex](self, "selectedURLIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addUserInfoEntriesFromDictionary:", v7);

  return v4;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (QLPreviewController)quicklookController
{
  return self->_quicklookController;
}

- (void)setQuicklookController:(id)a3
{
  objc_storeStrong((id *)&self->_quicklookController, a3);
}

- (NSUserActivity)quicklookActivity
{
  return self->_quicklookActivity;
}

- (void)setQuicklookActivity:(id)a3
{
  objc_storeStrong((id *)&self->_quicklookActivity, a3);
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)selectedURLIndex
{
  return self->_selectedURLIndex;
}

- (void)setSelectedURLIndex:(unint64_t)a3
{
  self->_selectedURLIndex = a3;
}

- (NSDictionary)editingModes
{
  return self->_editingModes;
}

- (void)setEditingModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingModes, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_quicklookActivity, 0);
  objc_storeStrong((id *)&self->_quicklookController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
