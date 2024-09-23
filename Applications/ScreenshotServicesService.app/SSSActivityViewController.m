@implementation SSSActivityViewController

- (id)screenshotItemProviders
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController activityItemProviders](self, "activityItemProviders", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        objc_opt_class(SSSScreenshotItemProvider, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          objc_msgSend(v3, "addObject:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v3, "copy");
  return v12;
}

- (id)screenshots
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshotItemProviders](self, "screenshotItemProviders", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screenshot"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screenshot"));
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = objc_msgSend(v3, "copy");
  return v12;
}

- (BOOL)didRenameScreenshot
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController renameOption](self, "renameOption"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)screenshotItemProvidersContainsPDF
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController activityItemProviders](self, "activityItemProviders", 0));
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_opt_class(SSSScreenshotItemProviderPDF, v3);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)screenshotItemProvidersContainsPDFAsImage
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController activityItemProviders](self, "activityItemProviders", 0));
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_opt_class(SSSScreenshotItemProviderPDFAsImage, v3);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)isSharingSingleFullPageScreenshot
{
  void *v3;
  BOOL v4;

  if ((id)-[SSSActivityViewController editMode](self, "editMode") != (id)1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots"));
  v4 = objc_msgSend(v3, "count") == (id)1;

  return v4;
}

- (BOOL)isSharingSingleFullPageScreenshotAsImageUsingAutomatic
{
  if (-[SSSActivityViewController isSharingSingleFullPageScreenshot](self, "isSharingSingleFullPageScreenshot")
    && !-[SSSActivityViewController editMode](self, "editMode"))
  {
    return -[SSSActivityViewController screenshotItemProvidersContainsPDF](self, "screenshotItemProvidersContainsPDF");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isSharingSingleFullPageScreenshotAsPDFUsingAutomatic
{
  if (-[SSSActivityViewController isSharingSingleFullPageScreenshot](self, "isSharingSingleFullPageScreenshot")
    && !-[SSSActivityViewController editMode](self, "editMode"))
  {
    return -[SSSActivityViewController screenshotItemProvidersContainsPDFAsImage](self, "screenshotItemProvidersContainsPDFAsImage");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isSharingSingleScreenScreenshot
{
  BOOL v3;
  void *v4;

  if (-[SSSActivityViewController editMode](self, "editMode"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots"));
  v3 = objc_msgSend(v4, "count") == (id)1;

  return v3;
}

- (BOOL)isSharingMultipleScreenScreenshots
{
  BOOL v3;
  void *v4;

  if (-[SSSActivityViewController editMode](self, "editMode"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots"));
  v3 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v3;
}

- (BOOL)isSharingMixedScreenshots
{
  void *v3;
  BOOL v4;

  if ((id)-[SSSActivityViewController editMode](self, "editMode") != (id)1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots"));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (SSSActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 editMode:(int64_t)a5
{
  id v8;
  SSSActivityViewController *v9;
  SSSActivityViewController *v10;
  NSString *renameOption;
  void *v12;
  void *v13;
  uint64_t UsedFullPageScreenshotShareAsOption;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SSSActivityViewController;
  v9 = -[SSSActivityViewController initWithActivityItems:applicationActivities:](&v16, "initWithActivityItems:applicationActivities:", v8, a4);
  v10 = v9;
  if (v9)
  {
    -[SSSActivityViewController setActivityItemProviders:](v9, "setActivityItemProviders:", v8);
    -[SSSActivityViewController setObjectManipulationDelegate:](v10, "setObjectManipulationDelegate:", v10);
    v10->_editMode = a5;
    renameOption = v10->_renameOption;
    v10->_renameOption = 0;

    if (-[SSSActivityViewController isSharingSingleFullPageScreenshot](v10, "isSharingSingleFullPageScreenshot"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](v10, "screenshots"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v10->_pdfCanBeConvertedToImage = objc_msgSend(v13, "pdfCanBeConvertedToImage");

    }
    else
    {
      v10->_pdfCanBeConvertedToImage = 0;
    }
    if (-[SSSActivityViewController pdfCanBeConvertedToImage](v10, "pdfCanBeConvertedToImage"))
      UsedFullPageScreenshotShareAsOption = _SSGetLastUsedFullPageScreenshotShareAsOption();
    else
      UsedFullPageScreenshotShareAsOption = 0;
    v10->_shareAsOption = UsedFullPageScreenshotShareAsOption;
    -[SSSActivityViewController didChangeShareOptions](v10, "didChangeShareOptions");
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSSActivityViewController;
  -[SSSActivityViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000182E4;
  v4[3] = &unk_100091D20;
  objc_copyWeak(&v5, &location);
  -[SSSActivityViewController setPreCompletionHandler:](self, "setPreCompletionHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportStatistics
{
  int64_t v3;
  void *v4;
  id v5;

  v3 = -[SSSActivityViewController shareAsOption](self, "shareAsOption");
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
      objc_msgSend(v4, "didShareFullPageScreenshotAsPDF");
    }
    else
    {
      if (v3 != 1)
        goto LABEL_17;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
      objc_msgSend(v4, "didShareFullPageScreenshotAsImage");
    }
  }
  else if (-[SSSActivityViewController isSharingSingleFullPageScreenshotAsImageUsingAutomatic](self, "isSharingSingleFullPageScreenshotAsImageUsingAutomatic"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v4, "didShareFullPageScreenshotAsAutomaticImage");
  }
  else if (-[SSSActivityViewController isSharingSingleFullPageScreenshotAsPDFUsingAutomatic](self, "isSharingSingleFullPageScreenshotAsPDFUsingAutomatic"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v4, "didShareFullPageScreenshotAsAutomaticPDF");
  }
  else if (-[SSSActivityViewController isSharingSingleScreenScreenshot](self, "isSharingSingleScreenScreenshot"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v4, "didShareScreenSingleScreenshots");
  }
  else if (-[SSSActivityViewController isSharingMultipleScreenScreenshots](self, "isSharingMultipleScreenScreenshots"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v4, "didShareScreenMultipleScreenshots");
  }
  else
  {
    if (!-[SSSActivityViewController isSharingMixedScreenshots](self, "isSharingMixedScreenshots"))
      goto LABEL_17;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v4, "didShareFullPageMixedScreenshots");
  }

LABEL_17:
  if (-[SSSActivityViewController didRenameScreenshot](self, "didRenameScreenshot"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v5, "didRenameScreenshot");

  }
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  return 1;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", a3));
  if (-[SSSActivityViewController pdfCanBeConvertedToImage](self, "pdfCanBeConvertedToImage"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController sendAsGroup](self, "sendAsGroup"));
    objc_msgSend(v4, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController renameGroup](self, "renameGroup"));
  objc_msgSend(v4, "addObject:", v6);

  return v4;
}

- (id)sendAsGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id location;
  void *v23;
  _QWORD v24[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SHARING_OPTIONS_SEND_AS_AUTOMATIC"), CFSTR("Automatic"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARING_OPTIONS_SEND_AS_IMAGE"), CFSTR("Single Image"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARING_OPTIONS_SEND_AS_PDF"), CFSTR("PDF Document"), 0));

  v24[0] = v4;
  v24[1] = v6;
  v24[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHARING_OPTIONS_SEND_AS_GROUP_FOOTER_TEXT"), CFSTR("Automatic selects the best format based on the screenshot being shared."), 0));

  objc_initWeak(&location, self);
  v12 = -[SSSActivityViewController shareAsOption](self, "shareAsOption");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100018808;
  v20[3] = &unk_100091D48;
  objc_copyWeak(&v21, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_UIActivityItemCustomization pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:](_UIActivityItemCustomization, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", CFSTR("SHARING_OPTIONS_SEND_AS_PICKER"), v9, v12, v11, v20));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SHARING_OPTIONS_SEND_AS_GROUP_TITLE"), CFSTR("Send as"), 0));

  v16 = objc_alloc((Class)_UIActivityItemCustomizationGroup);
  v23 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v18 = objc_msgSend(v16, "_initGroupWithName:identifier:customizations:", v15, CFSTR("SHARING_OPTIONS_SEND_AS_GROUP"), v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v18;
}

- (id)renameGroup
{
  void *v3;
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void **v21;
  uint64_t v22;
  void (*v23)(id *, void *);
  void *v24;
  id v25;
  id location;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots"));
  v4 = objc_msgSend(v3, "count") == (id)1;

  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController renameOption](self, "renameOption"));
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filename"));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filename"));

  }
  else
  {
    v8 = &stru_1000937C8;
    if (v5)
      v8 = v5;
    v7 = v8;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_OPTIONS_RENAME_MULTIPLE_PLACEHOLDER"), CFSTR("Multiple names"), 0));
  }

  objc_initWeak(&location, self);
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_100018B3C;
  v24 = &unk_100091D70;
  objc_copyWeak(&v25, &location);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_UIActivityItemCustomization textFieldCustomizationWithText:placeholder:identifier:footerText:textChangedHandler:](_UIActivityItemCustomization, "textFieldCustomizationWithText:placeholder:identifier:footerText:textChangedHandler:", v7, v10, CFSTR("SHARING_OPTIONS_RENAME_GROUP"), 0, &v21));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v21, v22, v23, v24));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SHARING_OPTIONS_RENAME_GROUP_TITLE"), CFSTR("File Name"), 0));

  v17 = objc_alloc((Class)_UIActivityItemCustomizationGroup);
  v27 = v14;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  v19 = objc_msgSend(v17, "_initGroupWithName:identifier:customizations:", v16, CFSTR("SHARING_OPTIONS_RENAME_GROUP"), v18);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v19;
}

- (void)didChangeRenameOption
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController renameOption](self, "renameOption"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController renameOption](self, "renameOption"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5));

    if (!objc_msgSend(v6, "length")
      || -[SSSActivityViewController isSharingSingleFullPageScreenshot](self, "isSharingSingleFullPageScreenshot")
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filename")),
          v10 = objc_msgSend(v6, "isEqualToString:", v9),
          v9,
          v8,
          v7,
          (v10 & 1) != 0))
    {
      v11 = 0;
    }
    else
    {
      v11 = v6;
    }
    -[SSSActivityViewController setRenameOption:](self, "setRenameOption:", v11);

  }
  -[SSSActivityViewController didChangeShareOptions](self, "didChangeShareOptions");
}

- (void)didChangeShareOptions
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController _updateItemProvidersWithOptions](self, "_updateItemProvidersWithOptions"));
  -[SSSActivityViewController setActivityItemProviders:](self, "setActivityItemProviders:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  -[SSSActivityViewController _updateActivityItems:](self, "_updateActivityItems:", v3);

  -[SSSActivityViewController _updateActivityItems:](self, "_updateActivityItems:", self->_activityItemProviders);
}

- (id)_updateItemProvidersWithOptions
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  id v14;
  __objc2_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController activityItemProviders](self, "activityItemProviders"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController activityItemProviders](self, "activityItemProviders"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v7));

      objc_opt_class(SSSScreenshotItemProvider, v10);
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
        break;
      objc_msgSend(v3, "addObject:", v9);
LABEL_19:

      ++v7;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController activityItemProviders](self, "activityItemProviders"));
      v21 = objc_msgSend(v20, "count");

      if (v7 >= (unint64_t)v21)
        return v3;
    }
    v12 = v9;
    v13 = -[SSSActivityViewController shareAsOption](self, "shareAsOption");
    if (v13 == 2)
    {
      v15 = SSSScreenshotItemProviderPDF;
    }
    else
    {
      if (v13 != 1)
      {
        if (v13)
          v14 = 0;
        else
          v14 = (id)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController _bestFormatForScreenshotItemProvider:](self, "_bestFormatForScreenshotItemProvider:", v12));
        goto LABEL_13;
      }
      v15 = SSSScreenshotItemProviderPDFAsImage;
    }
    v16 = [v15 alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screenshot"));
    v14 = objc_msgSend(v16, "initWithScreenshot:", v17);

LABEL_13:
    if (-[SSSActivityViewController didRenameScreenshot](self, "didRenameScreenshot"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController renameOption](self, "renameOption"));
      if (v6)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %li"), v18, v6));
        objc_msgSend(v14, "setOverrideName:", v19);

      }
      else
      {
        objc_msgSend(v14, "setOverrideName:", v18);
      }

    }
    objc_msgSend(v3, "addObject:", v14);
    ++v6;

    goto LABEL_19;
  }
  return v3;
}

- (id)_bestFormatForScreenshotItemProvider:(id)a3
{
  __objc2_class *v4;
  uint64_t v5;
  unsigned int v6;
  __objc2_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  Class v12;
  id v13;
  void *v14;
  id v15;

  v4 = (__objc2_class *)a3;
  v6 = -[SSSActivityViewController isSharingSingleFullPageScreenshot](self, "isSharingSingleFullPageScreenshot");
  v7 = v4;
  if (v6)
  {
    if (-[SSSActivityViewController pdfCanBeConvertedToImage](self, "pdfCanBeConvertedToImage")
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController screenshots](self, "screenshots")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "PDFDocument")),
          v11 = objc_msgSend(v10, "pageCount"),
          v10,
          v9,
          v8,
          v11 == (id)1))
    {
      v7 = SSSScreenshotItemProviderPDFAsImage;
    }
    else
    {
      v7 = SSSScreenshotItemProviderPDF;
    }
  }
  objc_opt_class(v7, v5);
  v13 = [v12 alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class screenshot](v4, "screenshot"));
  v15 = objc_msgSend(v13, "initWithScreenshot:", v14);

  return v15;
}

- (NSArray)activityItemProviders
{
  return self->_activityItemProviders;
}

- (void)setActivityItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemProviders, a3);
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(int64_t)a3
{
  self->_editMode = a3;
}

- (int64_t)shareAsOption
{
  return self->_shareAsOption;
}

- (void)setShareAsOption:(int64_t)a3
{
  self->_shareAsOption = a3;
}

- (NSString)renameOption
{
  return self->_renameOption;
}

- (void)setRenameOption:(id)a3
{
  objc_storeStrong((id *)&self->_renameOption, a3);
}

- (BOOL)pdfCanBeConvertedToImage
{
  return self->_pdfCanBeConvertedToImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renameOption, 0);
  objc_storeStrong((id *)&self->_activityItemProviders, 0);
}

@end
