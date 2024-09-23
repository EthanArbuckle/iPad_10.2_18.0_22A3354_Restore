@implementation SSSScreenshotManager

- (id)createScreenshotWithEnvironmentDescription:(id)a3
{
  id v4;
  SSSScreenshot *v5;

  v4 = a3;
  v5 = -[SSSScreenshot initWithEnvironmentDescription:]([SSSScreenshot alloc], "initWithEnvironmentDescription:", v4);

  -[NSMutableArray addObject:](self->_screenshots, "addObject:", v5);
  return v5;
}

- (id)_screenshotWithEnvironmentDescriptionIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_screenshots;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environmentDescription", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_screenshotWithEnvironmentElementWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  unsigned __int8 v16;
  id v17;
  uint64_t v19;
  id v20;
  NSMutableArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_screenshots;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v27;
    v21 = v5;
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "environmentDescription"));
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "elements"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1)
                                                                                 + 8 * (_QWORD)j), "identifier"));
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = v8;

                v5 = v21;
                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v12)
              continue;
            break;
          }
        }

        v5 = v21;
        v6 = v19;
      }
      v17 = 0;
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (void)processImageIdentifierUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentDescriptionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotManager _screenshotWithEnvironmentDescriptionIdentifier:](self, "_screenshotWithEnvironmentDescriptionIdentifier:", v5));

  if (v6)
  {
    if (objc_msgSend(v4, "success"))
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageProvider"));
      objc_msgSend(v8, "processImageIdentifier:", v7);

    }
    else
    {
      v7 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100057758(v4);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_imageIdentifierUpdateObservers;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "screenshotReceivedImageIdentifierUpdate:", v6, (_QWORD)v14);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }
  }
  else
  {
    v9 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
      sub_1000576E0(v4);

  }
}

- (BOOL)shouldCaptureDocumentForMetadataUpdate:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = self->_screenshots;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if (!-[SSSScreenshotManager _screenshotIsGoingAway:](self, "_screenshotIsGoingAway:", v11, (_QWORD)v21))
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentElementIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotManager _screenshotWithEnvironmentElementWithIdentifier:](self, "_screenshotWithEnvironmentElementWithIdentifier:", v12));

    v14 = -[SSSScreenshotManager _screenshotIsBeingRemoved:](self, "_screenshotIsBeingRemoved:", v13);
    v15 = objc_msgSend(v5, "indexOfObject:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
      v18 = objc_msgSend(v17, "canGenerateDocument");

    }
    else
    {
      v18 = 0;
    }

    v19 = (v15 == 0) & ~v14 & v18;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)processEnvironmentElementMetadataUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  NSObject *v17;
  void *v18;
  SSSScreenshotManager *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentElementIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotManager _screenshotWithEnvironmentElementWithIdentifier:](self, "_screenshotWithEnvironmentElementWithIdentifier:", v5));

  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "elements"));

    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v9)
    {
      v20 = self;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentElementIdentifier"));
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
            objc_msgSend(v12, "setMetadata:", v16);

            v9 = (id)-[SSSScreenshotManager shouldCaptureDocumentForMetadataUpdate:](v20, "shouldCaptureDocumentForMetadataUpdate:", v4);
            objc_msgSend(v6, "setIsPDFRequested:", v9);
            v25 = CFSTR("screenshot");
            v26 = v6;
            v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
            objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("SSSScreenshotManagerDidProcessMetadataUpdate"), v20, v17);

            goto LABEL_15;
          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
  else
  {
    v17 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000577D0(v4);
    LOBYTE(v9) = 0;
    v8 = v17;
LABEL_15:

  }
  return (char)v9;
}

- (void)processEnvironmentElementDocumentUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  SSSScreenshotManager *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentElementIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotManager _screenshotWithEnvironmentElementWithIdentifier:](self, "_screenshotWithEnvironmentElementWithIdentifier:", v5));

  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "elements"));

    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v9)
    {
      v10 = v9;
      v20 = self;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentElementIdentifier"));
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "document"));
            objc_msgSend(v13, "setDocument:", v17);

            objc_msgSend(v6, "_harvestPDFIfNecessary");
            v25 = CFSTR("screenshot");
            v26 = v6;
            v18 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
            objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("SSSScreenshotManagerDidProcessDocumentUpdate"), v20, v18);

            goto LABEL_15;
          }
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v10)
          continue;
        break;
      }
    }
  }
  else
  {
    v18 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100057848(v4);
    v8 = v18;
LABEL_15:

  }
}

- (void)addImageIdentifierUpdateObserver:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  -[NSMutableArray addObject:](self->_imageIdentifierUpdateObservers, "addObject:", v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_screenshots;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (_QWORD)v12));

        if (v11)
          objc_msgSend(v4, "screenshotReceivedImageIdentifierUpdate:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)removeImageIdentifierUpdateObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_imageIdentifierUpdateObservers, "removeObject:", a3);
}

- (void)saveEditsToScreenshotIfNecessary:(id)a3 inTransition:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSMutableArray *environmentDescriptionIdentifiersBeingSaved;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  SSSScreenshotManager *v27;
  _QWORD v28[4];
  id v29;
  SSSScreenshotManager *v30;
  uint8_t buf[4];
  void *v32;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "hasUnsavedImageEdits"))
  {
    v7 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loggableDescription"));
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving edits to screenshot image with environment description %@", buf, 0xCu);

    }
    v10 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loggableDescription"));
      *(_DWORD *)buf = 138412290;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Screenshot edits saved: %@", buf, 0xCu);

    }
    environmentDescriptionIdentifiersBeingSaved = self->_environmentDescriptionIdentifiersBeingSaved;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    -[NSMutableArray addObject:](environmentDescriptionIdentifiersBeingSaved, "addObject:", v14);

    -[SSSScreenshotManager _trackingChanged](self, "_trackingChanged");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSScreenshotAssetManager sharedAssetManager](SSScreenshotAssetManager, "sharedAssetManager"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100013F00;
    v28[3] = &unk_100091B98;
    v29 = v6;
    v30 = self;
    objc_msgSend(v15, "recordEditsToPersistable:inTransition:withCompletionBlock:", v29, v4, v28);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pdfData"));
  if (!v16 || !objc_msgSend(v6, "canAutosaveToFiles"))
    goto LABEL_13;
  v17 = objc_msgSend(v6, "isSavingForMode:", 1);

  if ((v17 & 1) == 0)
  {
    v18 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "loggableDescription"));
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Saving edits to screenshot pdf with environment description %@", buf, 0xCu);

    }
    v21 = self->_environmentDescriptionIdentifiersBeingSaved;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
    -[NSMutableArray addObject:](v21, "addObject:", v23);

    -[SSSScreenshotManager _trackingChanged](self, "_trackingChanged");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSScreenshotAssetManager sharedAssetManager](SSScreenshotAssetManager, "sharedAssetManager"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000141C0;
    v25[3] = &unk_100091B98;
    v26 = v6;
    v27 = self;
    objc_msgSend(v24, "recordEditsToPersistableForPDF:withCompletionBlock:", v26, v25);

    v16 = v26;
LABEL_13:

  }
}

- (BOOL)_screenshotIsBeingSaved:(id)a3
{
  NSMutableArray *environmentDescriptionIdentifiersBeingSaved;
  void *v4;
  void *v5;

  environmentDescriptionIdentifiersBeingSaved = self->_environmentDescriptionIdentifiersBeingSaved;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  LOBYTE(environmentDescriptionIdentifiersBeingSaved) = -[NSMutableArray containsObject:](environmentDescriptionIdentifiersBeingSaved, "containsObject:", v5);

  return (char)environmentDescriptionIdentifiersBeingSaved;
}

+ (void)_createTemporarySavingQueue
{
  if (qword_1000AD718 != -1)
    dispatch_once(&qword_1000AD718, &stru_100091BB8);
}

- (void)saveScreenshotsToTemporaryLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(self, v8), "_createTemporarySavingQueue");
  v9 = qword_1000AD710;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000145EC;
  v12[3] = &unk_100091960;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

- (void)removeScreenshot:(id)a3 deleteOptions:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  SSSScreenshotManager *v18;
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  void *v22;

  v6 = a3;
  if ((-[NSMutableArray containsObject:](self->_screenshots, "containsObject:", v6) & 1) == 0)
  {
    v7 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000578C0(v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  -[NSMutableArray addObject:](self->_environmentDescriptionIdentifiersBeingRemoved, "addObject:", v9);
  -[SSSScreenshotManager _trackingChanged](self, "_trackingChanged");
  v10 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loggableDescription"));
    *(_DWORD *)buf = 138412290;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removing screenshot with environment description %@", buf, 0xCu);

  }
  objc_msgSend(v6, "setIsDeleted:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageProvider"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100014B0C;
  v16[3] = &unk_100091C58;
  v17 = v6;
  v18 = self;
  v19 = v9;
  v20 = a4;
  v14 = v9;
  v15 = v6;
  objc_msgSend(v13, "scheduleDeletionBlock:", v16);

}

- (void)removeTemporaryScreenshotLocation:(id)a3 deleteOptions:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v6 = a3;
  if ((-[NSMutableArray containsObject:](self->_screenshots, "containsObject:", v6) & 1) == 0)
  {
    v7 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000578C0(v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageProvider"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014D8C;
  v10[3] = &unk_1000919E0;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  objc_msgSend(v8, "scheduleDeletionBlock:", v10);

}

- (BOOL)_screenshotIsGoingAway:(id)a3
{
  NSMutableArray *environmentDescriptionIdentifiersGoingAway;
  void *v4;
  void *v5;

  environmentDescriptionIdentifiersGoingAway = self->_environmentDescriptionIdentifiersGoingAway;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  LOBYTE(environmentDescriptionIdentifiersGoingAway) = -[NSMutableArray containsObject:](environmentDescriptionIdentifiersGoingAway, "containsObject:", v5);

  return (char)environmentDescriptionIdentifiersGoingAway;
}

- (BOOL)_screenshotIsBeingRemoved:(id)a3
{
  NSMutableArray *environmentDescriptionIdentifiersBeingRemoved;
  void *v4;
  void *v5;

  environmentDescriptionIdentifiersBeingRemoved = self->_environmentDescriptionIdentifiersBeingRemoved;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  LOBYTE(environmentDescriptionIdentifiersBeingRemoved) = -[NSMutableArray containsObject:](environmentDescriptionIdentifiersBeingRemoved, "containsObject:", v5);

  return (char)environmentDescriptionIdentifiersBeingRemoved;
}

- (BOOL)_areAnyScreenshotsActive
{
  char *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (char *)-[NSMutableArray count](self->_screenshots, "count");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_screenshots;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 -= -[SSSScreenshotManager _screenshotIsBeingRemoved:](self, "_screenshotIsBeingRemoved:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), (_QWORD)v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (uint64_t)v3 > 0;
}

- (void)userInterfaceBecameInterestedInScreenshot:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  -[NSMutableArray addObject:](self->_environmentDescriptionIdentifiersUIIsInterestedIn, "addObject:", v5);
  -[SSSScreenshotManager _trackingChanged](self, "_trackingChanged");

}

- (void)userInterfaceWillStopBeingInterestedInScreenshot:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  -[NSMutableArray addObject:](self->_environmentDescriptionIdentifiersGoingAway, "addObject:", v5);
}

- (void)userInterfaceStoppedBeingInterestedInScreenshot:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  -[NSMutableArray removeObject:](self->_environmentDescriptionIdentifiersUIIsInterestedIn, "removeObject:", v5);
  -[SSSScreenshotManager _reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:](self, "_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:", v5);

}

- (void)screenshotEnteredDragSession:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  -[NSMutableArray addObject:](self->_environmentDescriptionIdentifiersInActiveDragSession, "addObject:", v5);
  -[SSSScreenshotManager _trackingChanged](self, "_trackingChanged");

}

- (void)screenshotLeftDragSession:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  -[NSMutableArray removeObject:](self->_environmentDescriptionIdentifiersInActiveDragSession, "removeObject:", v5);
  -[SSSScreenshotManager _reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:](self, "_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:", v5);

}

- (void)performIfNoScreenshotsAreActive:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (!-[SSSScreenshotManager _areAnyScreenshotsActive](self, "_areAnyScreenshotsActive"))
    v4[2]();

}

- (void)_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_environmentDescriptionIdentifiersUIIsInterestedIn, "containsObject:", v4) & 1) == 0&& (-[NSMutableArray containsObject:](self->_environmentDescriptionIdentifiersInActiveDragSession, "containsObject:", v4) & 1) == 0&& (-[NSMutableArray containsObject:](self->_environmentDescriptionIdentifiersBeingSaved, "containsObject:", v4) & 1) == 0&& (-[NSMutableArray containsObject:](self->_environmentDescriptionIdentifiersBeingRemoved, "containsObject:", v4) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotManager _screenshotWithEnvironmentDescriptionIdentifier:](self, "_screenshotWithEnvironmentDescriptionIdentifier:", v4));
    v6 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loggableDescription"));
      v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Stopping tracking screenshot with environment description %@", (uint8_t *)&v11, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    -[NSMutableArray removeObject:](self->_environmentDescriptionIdentifiersGoingAway, "removeObject:", v8);
    -[NSMutableArray removeObject:](self->_environmentDescriptionIdentifiersBeingRemoved, "removeObject:", v8);
    -[NSMutableArray removeObject:](self->_environmentDescriptionIdentifiersBeingSaved, "removeObject:", v8);
    -[NSMutableArray removeObject:](self->_screenshots, "removeObject:", v5);
    if (!-[NSMutableArray count](self->_screenshots, "count"))
    {
      v9 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No longer tracking any screenshots - posting notification", (uint8_t *)&v11, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("SSSScreenshotManagerStoppedTrackingScreenshots"), self);

    }
  }
  -[SSSScreenshotManager _trackingChanged](self, "_trackingChanged");

}

- (void)_trackingChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SSSScreenshotManagerTrackingChanged"), self);

}

- (SSSScreenshotManager)init
{
  SSSScreenshotManager *v2;
  uint64_t v3;
  NSMutableArray *screenshots;
  uint64_t v5;
  NSMutableArray *environmentDescriptionIdentifiersUIIsInterestedIn;
  uint64_t v7;
  NSMutableArray *environmentDescriptionIdentifiersGoingAway;
  uint64_t v9;
  NSMutableArray *environmentDescriptionIdentifiersInActiveDragSession;
  uint64_t v11;
  NSMutableArray *environmentDescriptionIdentifiersBeingRemoved;
  uint64_t v13;
  NSMutableArray *environmentDescriptionIdentifiersBeingSaved;
  uint64_t v15;
  NSMutableArray *imageIdentifierUpdateObservers;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SSSScreenshotManager;
  v2 = -[SSSScreenshotManager init](&v18, "init");
  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  screenshots = v2->_screenshots;
  v2->_screenshots = (NSMutableArray *)v3;

  v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  environmentDescriptionIdentifiersUIIsInterestedIn = v2->_environmentDescriptionIdentifiersUIIsInterestedIn;
  v2->_environmentDescriptionIdentifiersUIIsInterestedIn = (NSMutableArray *)v5;

  v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  environmentDescriptionIdentifiersGoingAway = v2->_environmentDescriptionIdentifiersGoingAway;
  v2->_environmentDescriptionIdentifiersGoingAway = (NSMutableArray *)v7;

  v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  environmentDescriptionIdentifiersInActiveDragSession = v2->_environmentDescriptionIdentifiersInActiveDragSession;
  v2->_environmentDescriptionIdentifiersInActiveDragSession = (NSMutableArray *)v9;

  v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  environmentDescriptionIdentifiersBeingRemoved = v2->_environmentDescriptionIdentifiersBeingRemoved;
  v2->_environmentDescriptionIdentifiersBeingRemoved = (NSMutableArray *)v11;

  v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  environmentDescriptionIdentifiersBeingSaved = v2->_environmentDescriptionIdentifiersBeingSaved;
  v2->_environmentDescriptionIdentifiersBeingSaved = (NSMutableArray *)v13;

  v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  imageIdentifierUpdateObservers = v2->_imageIdentifierUpdateObservers;
  v2->_imageIdentifierUpdateObservers = (NSMutableArray *)v15;

  return v2;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v17.receiver = self;
  v17.super_class = (Class)SSSScreenshotManager;
  v4 = -[SSSScreenshotManager description](&v17, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "appendString:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](self->_screenshots, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" screenshots: %@"), v6));
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](self->_environmentDescriptionIdentifiersUIIsInterestedIn, "description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" environment description identiifers in UI: %@"), v8));
  objc_msgSend(v3, "appendString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](self->_environmentDescriptionIdentifiersGoingAway, "description"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" environment description identiifers going away: %@"), v10));
  objc_msgSend(v3, "appendString:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](self->_environmentDescriptionIdentifiersBeingSaved, "description"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" environment description identiifers being saved: %@"), v12));
  objc_msgSend(v3, "appendString:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](self->_environmentDescriptionIdentifiersBeingRemoved, "description"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" environment description identiifers being removed: %@"), v14));
  objc_msgSend(v3, "appendString:", v15);

  return v3;
}

- (NSArray)environmentDescriptionIdentifiersBeingTracked
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_screenshots;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "environmentDescription", (_QWORD)v12));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        objc_msgSend(v3, "addObject:", v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)environmentDescriptionIdentifiersUIIsInterestedIn
{
  return (NSArray *)self->_environmentDescriptionIdentifiersUIIsInterestedIn;
}

- (id)environmentDescriptionIdentifiersGoingAway
{
  return self->_environmentDescriptionIdentifiersGoingAway;
}

- (NSArray)environmentDescriptionIdentifiersInActiveDragSession
{
  return (NSArray *)self->_environmentDescriptionIdentifiersInActiveDragSession;
}

- (NSArray)environmentDescriptionIdentifiersBeingRemoved
{
  return (NSArray *)self->_environmentDescriptionIdentifiersBeingRemoved;
}

- (NSArray)environmentDescriptionIdentifiersBeingSaved
{
  return (NSArray *)self->_environmentDescriptionIdentifiersBeingSaved;
}

+ (id)sharedScreenshotManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000158A8;
  block[3] = &unk_100091C98;
  block[4] = a1;
  if (qword_1000AD728 != -1)
    dispatch_once(&qword_1000AD728, block);
  return (id)qword_1000AD720;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageIdentifierUpdateObservers, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersBeingSaved, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersBeingRemoved, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersInActiveDragSession, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersGoingAway, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersUIIsInterestedIn, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end
